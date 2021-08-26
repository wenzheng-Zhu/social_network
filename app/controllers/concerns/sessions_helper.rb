module SessionsHelper

  def current_user
    login_token = request.headers['Login-Token']
    return nil if login_token.nil?

    user = User.find_by(login_token: login_token)
  end

  def authenticate!
    render json: error_json('请先登录', 401) unless current_user
  end

end