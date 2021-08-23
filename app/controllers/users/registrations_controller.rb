# app/controllers/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController

  def new
    coupon = Coupon.initial.find_by(code: params["coupon"])

    if coupon.present?
      super
    else
      redirect_to root_path
    end
  end

  def create
    coupon = Coupon.initial.find_by(code: params["user"]["coupon"])

    if coupon.present?
      super do |user|
        coupon.update!(user: user, using_state: "complete") if resource.persisted?
      end
    else
      redirect_to root_path
    end
  end
end