# frozen_string_literal: true

require 'rails_helper'

module Api
  module V1
    module Administration
      describe UsersController, type: :controller do
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
