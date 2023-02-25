# frozen_string_literal: true

module Api
  module V1
    class PingsController < ApplicationController
      def show
        render json: { data: 'pong' }
      end
    end
  end
end
