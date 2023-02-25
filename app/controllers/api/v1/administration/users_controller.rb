# frozen_string_literal: true

module Api
  module V1
    module Administration
      class UsersController < ApplicationController
        skip_before_action :verify_authenticity_token

        def create
          @user = User.new(create_params)

          if @user.save
            render :create, status: :created
          else
            render 'api/v1/errors', status: :unprocessable_entity,
                                    locals: { errors: @user.errors, source_pointer_prefix: 'user' }
          end
        end

        def create_params
          params.require(:user)
                .permit(:email_address)
        end
      end
    end
  end
end
