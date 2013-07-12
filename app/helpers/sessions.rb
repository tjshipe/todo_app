helpers do
  
  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_list(x)
    current_user.lists.find(x)
  end

end
