# Changelog

## 0.0.1.pre.2
- has a rails engine with a initializer hook called `socialite_js.javascript_helper`  
  it provides helper methods `socialite_javascript_tag` and methods for  
  socialite extensions like `socialite_github_javascript_tag`  
  Also `socialite_javascript_tag` is customized based on Rails
  environment, on production the minimized version is used.
