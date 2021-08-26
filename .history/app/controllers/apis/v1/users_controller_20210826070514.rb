module Apis
  module V1
    class UsersController < BaseController
      include SessionsHelper
      before_action :authenticate!, only: %i[article_publishing followed_articles]
      def create
        user = User.new(user_params)
        if user.save
          data = { message: '注册成功', code: 200, user: user }
          render json: success_json(data)
        else
          errors = user.errors.messages
          render json: error_json('创建失败', 500, errors)
        end
      end

      def article_publishing
        article = current_user.articles.build(article_params)
        if article.save
          data = { message: '发布信息成功', code: 200, article: article }
          render json: success_json(data)
        else
          errors = article.errors.messages
          render json: error_json('发布信息失败', 500, errors)
        end
      end

      #找出关注的人发布的信息
      def followed_articles
        active_relationships = current_user.active_relationships
        if active_relationships.present?

        end
        
      end

      private

      def user_params
        params.permit(:name, :email, :password, :password_confirmation, :login_token)
      end

      def article_params
        params.permit(:title, :content, :user_id)
      end

    end
  end
end