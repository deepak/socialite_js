require 'rails'
require 'active_support'

module SocialiteJs
  class Engine < ::Rails::Engine
    isolate_namespace SocialiteJs
    
    initializer 'socialite_js.javascript_helper' do
      ActiveSupport.on_load(:action_controller) do
        require 'socialite_js/on_load_action_controller'
        helper SocialiteJs::JavascriptHelper
      end
    end
  end
end
