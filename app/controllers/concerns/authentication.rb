module Authentication
  def current_user
    token = User::Token.new
    session[:remember_token] = token
    Visitor.create(remember_token: token)
  end
end
