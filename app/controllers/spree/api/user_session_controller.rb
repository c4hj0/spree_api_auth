module Spree
  module Api
    class UserSessionController < Spree::Api::BaseController
      include Spree::Core::ControllerHelpers::Auth
      include Spree::Core::ControllerHelpers::Order
      
      # expects json:
      # { session: {
      #      "email": "",
      #      "password": ""
      #   }
      # }
      # TODO. create/load session ?
      def create
        user = Spree::User.find_for_database_authentication(:login => params[:session][:email])
        if user && user.valid_password?(params[:session][:password])
          @order = current_order(:create_order_if_necessary => true)
          @user = user
          respond_with(user, :status => 200, :default_template => :show)
        else
          render "spree/api/errors/login_error", status: 401 and return
        end
      end

      def show
        # lookup user by token or session
        if user
          @order = current_order
          @user = user
          respond_with(user, :status => 200, :default_template => :show)
        else
          binding.pry
          invalid_resource!(@user)
        end
      end

      def destroy
        # Do we really need to clear cookies & session?
        # Not all api clients will be browsers.
        cookies.clear
        session.clear
        super
      end

      private

      def user
        @current_api_user || try_spree_current_user
      end

      def authenticate_spree_user
        build_resource
        resource = Spree::User.find_for_database_authentication(:login=>params[:login])
        return invalid_login_attempt unless resource
      end

      def session_params
        params.require(:session).permit([:email, :password])
      end
    end
  end
end
