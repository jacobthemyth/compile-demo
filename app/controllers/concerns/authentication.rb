module Authentication
  def current_user
    if session[:remember_token].present?
      Visitor.find_by!(remember_token: session[:remember_token])
    else
      token = User::Token.new
      session[:remember_token] = token
      Visitor.create(remember_token: token)
    end
  end
end
