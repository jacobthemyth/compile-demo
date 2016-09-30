module Authentication
  def current_user
    token = User::Token.new
    Visitor.create(remember_token: token)
  end
end
