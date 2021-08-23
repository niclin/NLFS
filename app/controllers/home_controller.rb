class HomeController < ApplicationController
  def vip_lobby
  end

  def enter_lobby
    if Coupon.initial.where(code: params["coupon"]).exists?
      redirect_to new_user_registration_path(coupon: params["coupon"]), notice: "成功進入註冊頁面"
    else
      redirect_back(fallback_location: root_path, alert: "該代碼錯誤或是已被使用。")
    end
  end
end
