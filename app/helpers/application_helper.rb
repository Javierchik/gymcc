module ApplicationHelper
  def set_as_current_tab(routes, only_class_name=false, class_name="active")
    retval = only_class_name ? class_name : "class='#{class_name}'"
    routes.each do |route|
      return retval if controller.controller_path == route["controller_path"] &&
        (controller.action_name == route["action_name"] || route["action_name"] == "any")
    end
    ""
  end
end