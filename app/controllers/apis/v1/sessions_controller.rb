module Apis
  module V1
    class SessionsController < BaseController
      def create
        user = User.find_by(email: params[:email].downcase)
        if user&.authenticate(params[:password])
          login_token = SecureRandom.urlsafe_base64
          user.update(login_token: login_token)
          data = { message: '登录成功', code: 200, login_token: user.login_token }
          render json: success_json(data)
        else
          render json: error_json('登录失败，错误的用户名或者密码', 500)
        end
      end
    end
  end
end
