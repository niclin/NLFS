module ApplicationHelper
  def default_meta_tags
    {
      site:        "NLFS - 便友停機坪",
      description: "大便的人不會寂寞，不只是一個梗、一首歌或是一張貼紙，他凝聚了一群有白爛靈魂的車友，這裡就是便友專屬的停機坪。",
      keywords:    "改裝, 機車, 勁戰, 雷霆",
      # og: {
      #   image: ActionController::Base.helpers.asset_path('logo.png')
      # },
      # fb: {
      #   app_id: "1304370673045470"
      # },
      reverse: true
    }
  end
end
