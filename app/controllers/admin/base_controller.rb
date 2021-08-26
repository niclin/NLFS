class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required

  layout "admin"

  private

  def admin_required
    unless current_user.is_admin?
      redirect_to "/"
    end
  end
end
