module UsersHelper
  def user_name(user)
    first_name = user.first_name
    last_name = user.last_name
    user_name = first_name + last_name
    return user_name
  end
end
