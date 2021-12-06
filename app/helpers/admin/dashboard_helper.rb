module Admin::DashboardHelper
  def current_user_image(id)
    user = User.find_by(id: id)
    return user
  end

  def image_default_url
    'https://icons.veryicon.com/png/o/miscellaneous/two-color-icon-library/user-286.png'
  end
end
