Spree::Core::Engine.routes.draw do
  namespace :api, :defaults => { :format => 'json' } do
    namespace :v1 do
      post  :sign_up, to: 'user_sessions#sign_up' 
      post  :sign_in, to: 'user_sessions#sign_in'
    end
  end
end
