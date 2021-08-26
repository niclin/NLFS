module ApplicationHelper
  def default_meta_tags
    {
      site:        "NLFS - 大便的人不會寂寞",
      description: "便友聚集地",
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
