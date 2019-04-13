class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  has_many :receivers,  class_name:  'ThxTxn', serializer: ThxTxnSerializer,
           foreign_key: 'receiver_id', dependent: :nullify
  has_many :senders,  class_name:  'ThxTxn', serializer: ThxTxnSerializer,
           foreign_key: 'sender_id', dependent: :nullify
  attributes :id, :name, :nickname, :email, :avatar_url, :created_at

  def avatar_url
    url_for(object.avatar) if object.avatar.attached?
  end
end
