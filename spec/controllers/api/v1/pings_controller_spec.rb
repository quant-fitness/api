# frozen_string_literal: true

require "rails_helper"

module Api
  module V1
    describe PingsController, type: :controller do
      describe "#show" do
        before { get :show }

        it { should respond_with :ok }
      end
    end
  end
end

