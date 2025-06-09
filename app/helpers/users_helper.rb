module UsersHelper
  def user_avatar(user)
    user.avatar.attached? ? url_for(user.avatar) : "default-avatar.png"
  end

  def user_avatar_url(user)
    "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}?s=200"
  end
end
