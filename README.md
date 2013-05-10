# SocialiteJs

Integrate socialite.js into Ruby on Rails. check http://socialitejs.com/}

The javascript source is vendorized in a seperate gem called `socialite_js-source`
Use that if you want the javascript files and want to integrate yourself
Doing that will save you from managing the javascript files manually

## Installation

Add this line to your application's Gemfile:

    gem 'socialite_js'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install socialite_js

## Usage

for Ruby on Rails, add the following lines to your Gemfile

gem "socialite_js", "~> <the-current-version>", :require => "socialite_js/rails"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
