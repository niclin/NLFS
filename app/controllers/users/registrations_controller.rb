# app/controllers/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  def create
    coupon = Coupon.find_by(code: params["user"]["coupon"])

    if coupon.present?
      super
    else
      redirect_to root_path
    end
  end
end