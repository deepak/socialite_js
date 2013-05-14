require 'socialite_js/source'
require 'rails'

module SocialiteJs
  module JavascriptHelper
    def socialite_javascript_tag
      js_path = if Rails.env.production?
                  Source.bundled_minimized_path
                else
                  Source.bundled_path
                end
      javascript_include_tag js_path
    end

    def respond_to?(method_sym, include_private = false)
      if respond_to_socialite_extension? method_sym.to_s
        true
      else
        super
      end
    end
    
    def method_missing(method_sym, *args, &block)
      if match = respond_to_socialite_extension?(method_sym.to_s)
        javascript_include_tag SocialiteJs::Source.send("#{match['extension_name']}_extension_path")
      else
        super
      end
    end

    protected
    def respond_to_socialite_extension? method_str
      # NOTE: not checking if the file actually exists. but checking
      # from a master list of supported extensions
      if (match = method_str.match(/\Asocialite_(?<extension_name>(.)+)_javascript_tag\z/)) &&
          SocialiteJs::Source.supported_extensions.include?(match['extension_name'])
        match
      else
        false
      end
    end
    
  end
end
