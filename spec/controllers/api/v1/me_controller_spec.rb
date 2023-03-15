# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    describe MeController, type: :controller do
      render_views

      describe '#index' do
        context "when there is a user logged in" do
          let(:user)        { FactoryBot.create(:user) }
          let(:token) { instance_double('Doorkeeper::AccessToken', :acceptable? => true, resource_owner_id: user.id) }

          before do
            allow(controller).to receive(:doorkeeper_token) { token }
            get :index, format: :json
          end

          it { should respond_with :ok }

          it "returns the user" do
            parsed_body = JSON.parse(response.body)
            expect(parsed_body).to eq({"data" => {"emailAddress" => user.email_address}})
          end
        end

        context "when there is nobody logged in" do
          before { get :index, format: :json }

          it { should respond_with :ok }

          it "returns null" do
            parsed_body = JSON.parse(response.body)
            expect(parsed_body).to eq({"data" => nil})
          end
        end
      end
    end
  end
end
