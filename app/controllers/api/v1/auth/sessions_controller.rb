module Api
  module V1
    module Auth
      class SessionsController < DeviseTokenAuth::SessionsController

        def create
          puts resource_params.keys.map(&:to_sym)
          puts resource_class.authentication_keys
          super
        end
        private

        def find_resource(field, value)
          q = "#{field.to_s.downcase}= ?"
          resource_class.where(q, value.downcase).first
        end

        def resource_params
          params.permit(:code, :password)
        end

        def get_resource_from_params
          code = params[:code]
          password = params[:password]

          return nil unless code && password

          resource = resource_class.where(code: code).first
          if resource && resource.valid_password?(password)
            resource
          else
            nil
          end
        end
      end
    end
  end
end
