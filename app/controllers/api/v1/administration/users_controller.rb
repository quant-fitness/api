# frozen_string_literal: true

module Api
  module V1
    module Administration
      class UsersController < ApplicationController
        skip_before_action :verify_authenticity_token

        def index
          @users = User.page params[:page]
        end

        def create
          @user = User.new(create_params)

          if @user.save
            render :create, status: :created
          else
            render 'api/v1/errors', status: :unprocessable_entity,
                                    locals: { errors: @user.errors, source_pointer_prefix: 'user' }
          end
        end

        def destroy
          @user = User.find_by_id(params[:id])

          if @user.nil?
            render 'api/v1/not_found_error', status: :not_found,
                                             locals: { source_pointer_prefix: 'user' }
          else
            @user.destroy
            render :destroy
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
