class ApplicationController < ActionController::Base
  include SessionsHelper
  include ClassListsHelper
  protect_from_forgery with: :exception


end
