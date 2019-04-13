class UsersController < ApplicationController
  # before_action :with_avatar, only: [:me]

  def me
    serialized_data = ActiveModelSerializers::Adapter::Json.new(
      UserSerializer.new(current_user)
    ).serializable_hash
    render json: serialized_data
  end

  private

  def with_avatar
    url_for(current_user.avatar)
  end
end