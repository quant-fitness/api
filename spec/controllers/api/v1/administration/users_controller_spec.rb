# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    module Administration
      describe UsersController, type: :controller do
        describe '#destroy' do
          let!(:user) { FactoryBot.create(:user) }
          let(:user_id) { user.id }

          before { delete :destroy, params: { id: user_id }, format: 'json' }

          context 'when the user exists' do
            it 'destroys the given user' do
              expect(User.all).to be_empty
            end

            it { should respond_with :ok }
            it { should render_template 'api/v1/administration/users/destroy' }
          end

          context 'when the user exists' do
            let(:user_id) { SecureRandom.uuid }

            it 'does not destroy any users' do
              expect(User.all).to_not be_empty
            end

            it { should respond_with :not_found }
            it { should render_template 'api/v1/not_found_error' }
          end
        end

        describe '#index' do
          before { get :index, format: 'json' }
          it { should respond_with :ok }
          it { should render_template 'api/v1/administration/users/index' }
        end

        describe '#create' do
          let(:valid_attributes) { FactoryBot.attributes_for(:user) }

          context 'with invalid attribues' do
            before { post :create, params: { user: valid_attributes.merge(email_address: nil) }, format: 'json' }

            it { should respond_with :unprocessable_entity }
            it { should render_template 'api/v1/errors' }
          end

          context 'with valid attribues' do
            before { post :create, params: { user: valid_attributes }, format: 'json' }

            it { should respond_with :created }
            it { should render_template 'api/v1/administration/users/create' }
          end
        end
      end
    end
  end
end
