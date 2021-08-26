module Apis
  module  V1
    class BaseController < ApplicationController
      include SessionsHelper
      def success_json(data = { message: '操作成功', code: 200 } )
        data.to_json.gsub('null', '""')
      end

      def error_json(message, code, errors = {})
        { message: message, code: code, errors: errors }.to_json
      end
    end
  end
end