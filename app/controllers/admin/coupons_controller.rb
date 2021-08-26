class Admin::CouponsController < Admin::BaseController
  def index
    @coupons = Coupon.all.recent
  end

  def batch_create
    total = 10

    total.times { Coupon.create! }

    redirect_back(fallback_location: admin_coupons_path, notice: "成功建立 #{total} 筆 Coupon")
  end

  def tag_sended
    @coupon = Coupon.find(params[:id])

    if @coupon.update(send_at_unixtime: Time.zone.now.to_i)
      redirect_back(fallback_location: admin_coupons_path, notice: "成功將 ID: #{@coupon.id} 送出給用戶！")
    else
      redirect_back(fallback_location: admin_coupons_path, notice: "失敗！ID: #{@coupon.id}")
    end
  end
end
