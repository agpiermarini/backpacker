module ApplicationHelper
  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_path
    request.path
  end

  def nav_bar
    return "layouts/nav_neutral" if current_path == login_path
    current_user ? "layouts/nav_user" : "layouts/nav_visitor"
  end
end
