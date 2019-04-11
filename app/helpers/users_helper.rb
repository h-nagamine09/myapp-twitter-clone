module UsersHelper
  # gravatar_url 画像のURL
  def gravatar_url(user,options = {size: 80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gracatar_id}?s=#{size}"
  end
end
