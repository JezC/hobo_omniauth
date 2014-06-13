Rails.application.routes.draw do
  @controller = ApplicationController.subclasses.find{|c| c.ancestors.include?(HoboOmniauth::Controller)}
  if @controller
    via: [:get, :post] '/auth/:provider/callback' => "#{@controller.controller_name}#omniauth_callback"
    via: [:get, :post] '/auth/failure' => "#{@controller.controller_name}#omniauth_callback"
  end
end
