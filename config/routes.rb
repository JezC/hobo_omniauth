Rails.application.routes.draw do
  @controller = ApplicationController.subclasses.find{|c| c.ancestors.include?(HoboOmniauth::Controller)}
  if @controller
    get '/auth/:provider' => "#{@controller.controller_name}#omniauth_callback", :as => "auth_callback"
    get '/auth/failure' => "#{@controller.controller_name}#omniauth_callback", :as => "auth_failure"
    post '/auth/:provider' => "#{@controller.controller_name}#omniauth_callback", :as => "auth_callback_post"
    post '/auth/failure' => "#{@controller.controller_name}#omniauth_callback", :as => "auth_failure_post"
  end    
end