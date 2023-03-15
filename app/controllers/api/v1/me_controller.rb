class Api::V1::MeController < ApplicationController
  def index
    @current_user = current_resource_owner
  end

  private

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
