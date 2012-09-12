module ApplicationHelper
  def set_as_current_tab(routes, only_class_name=false, class_name="active")
    retval = only_class_name ? class_name : "class='#{class_name}'"
    routes.each do |route|
      return retval if controller.controller_path == route["controller_path"] &&
        (controller.action_name == route["action_name"] || route["action_name"] == "any")
    end
    ""
  end

  def wicked_pdf_stylesheet_link_tag(*sources)
    sources.collect { |source| "<style type='text/css'>#{Rails.application.assets.find_asset(source+".css")}</style>"}.join("\n").html_safe
  end

  def wicked_pdf_image_tag(img, options={})
    asset = Rails.application.assets.find_asset(img)
    image_tag "file://#{asset.pathname.to_s}", options
  end

end