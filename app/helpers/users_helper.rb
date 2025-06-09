module UsersHelper
  def user_avatar(user)
    user.avatar.attached? ? url_for(user.avatar) : 'default-avatar.png'
  end
end 