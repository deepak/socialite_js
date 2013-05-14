require 'rails'
require 'rails/engine'
require 'active_support'
require 'debugger'

module SocialiteJs
  class Engine < Rails::Engine
    isolate_namespace SocialiteJs
    
    initializer "socialite_js", :group => :all do |app|
      debugger
      ActiveSupport.on_load(:action_controller) do
        debugger
        require 'socialite_js/on_load_action_controller'
        helper SocialiteJs::JavascriptHelper
      end
    end
  end
end
