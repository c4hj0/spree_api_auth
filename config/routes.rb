Spree::Core::Engine.routes.draw do
  namespace :api, :defaults => { :format => 'json' } do
    namespace :v1 do
      resource :session, controller: :user_session
    end
  end
end
