Rails.application.config.action_dispatch.cookies_serializer =:json 
Devise.setup do |config| 
    config.secret_key = Rails.application.credentials.secret_key_base 
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com' 
require 'devise/orm/active_record' 
  config.case_insensitive_keys = [:email] 

  config.stripe_whitespace_keys = [:email] 

  config.skip_session_storage =[:http_auth] 
  config.stretches = Rails.env.test? ? 1: 12 
  config.send_email_changed_notification = false
  config.send_password_change_notification = false
config.reconfirmable =true 
config.expire_all_remember_me_on_sign_out = true 

config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

config.sign_out_via = :delete 

env_creds = Rails.application.credentials[Rails.env.to_sym] ||{} 
%i {facebook twitter github }.each do |provider| 
    if options = env_creds[provider] 
        config.omniauth provider ,options [:app_id] , options [:app_secret], options.fetch(:options, {} ) 
    end 
end

end 
