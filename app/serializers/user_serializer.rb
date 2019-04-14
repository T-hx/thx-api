class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :nickname, :email, :address, :thx_balance, :received_thx, :avatar_url, :created_at

  def avatar_url
    url_for(object.avatar) if object.avatar.attached?
  end
end
