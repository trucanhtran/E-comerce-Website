class AdminApplicationController < ActionController::Base
  before_action :authenticate_user!
  layout 'admin'
end
