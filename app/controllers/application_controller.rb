class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: ->{request.format.json?}
  protect_from_forgery with: :exception, if: ->{!request.format.json?}

  include Response
  include ExceptionHandler
end
