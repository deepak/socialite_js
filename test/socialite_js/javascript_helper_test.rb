require 'test_helper'
require 'minitest/mock'
require 'socialite_js/javascript_helper'

class App
  include SocialiteJs::JavascriptHelper

  # stub render to return path to check
  def render options
    options[:partial]
  end
end

def stub_rails_production
  class << Rails.env
    def production?; true; end
  end
end

def stub_rails_development
  class << Rails.env
    def production?; false; end
  end
end

module SocialiteJs::JavascriptHelper  
  describe "#socialite_javascript_tag" do    

    before do
      @subject = App.new
    end
    
    it "responds to socialite_javascript_tag" do
      @subject.respond_to?(:socialite_javascript_tag).must_equal true
    end
    
    it "returns the minimized js path for Rails production env" do
      stub_rails_production
      @subject.socialite_javascript_tag.must_match /(socialite\.min\.js)\z/
    end

    it "returns the js path for non-production Rails env" do
      stub_rails_development
      @subject.socialite_javascript_tag.must_match /(socialite\.js)\z/
    end
  end

  describe "#socialite_extension_javascript_tag" do
    before do
      @subject = App.new
    end
    
    it "returns the js path for an extension" do
      @subject.socialite_github_javascript_tag.must_match /(socialite\.github\.js)\z/
    end

    it "responds to an extension supported extension type" do
      @subject.respond_to?(:socialite_github_javascript_tag).must_equal true
      @subject.respond_to?(:socialite_foo_javascript_tag).must_equal    false
    end
  end
  
end
