class Admin::ApplicationController < ApplicationController
  include AuthHelper
  before_action :authenticate_user!, :authorize
  helper_method :current_user

  USERS_PER_PAGE = 15

  def authorize
    render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false) if (forbidden?)
  end

  def forbidden?
    !current_user.is_a?(Admin)
  end
end