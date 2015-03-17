Spree::Core::Engine.routes.draw do
  namespace :api, :defaults => { :format => 'json' } do
    resource :session, controller: :user_session
  end
end
