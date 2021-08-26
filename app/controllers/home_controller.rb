class HomeController < ApplicationController
  def vip_lobby
    set_meta_tags title: "VIP 專屬大廳",
                  description: "只有真正的便友，才能進入"
  end

  def guide
    set_meta_tags title: "如何成為便友？",
                  description: "如果只有心中所想，寂寞將在黑夜再次悄然而襲，您必須於蝦皮網站，購買專屬貼紙"
  end

  def enter_lobby
    if Coupon.initial.where(code: params["coupon"]).exists?
      redirect_to new_user_registration_path(coupon: params["coupon"]), notice: "成功進入註冊頁面"
    else
      redirect_back(fallback_location: root_path, alert: "該代碼錯誤或是已被使用。")
    end
  end
end
