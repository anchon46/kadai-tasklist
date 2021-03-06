module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    
  end

def current_user  
  if (user_id = session[:user_id])  
@current_user ||= User.find_by(id: user_id)  
  elsif (user_id = cookies.signed[:user_id])  
    user = User.find_by(id: user_id)  
  if user && user.authenticated?(cookies[:remember_token])  
    log_in user  
@current_user = user  
  end  
  end  
end  

  def logged_in?
    !!current_user
  end
  
  def current_user?(user)  
    user == current_user  
  end  
end
