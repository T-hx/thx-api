class ThxTxnSerializer < ActiveModel::Serializer
  belongs_to :sender, class_name: 'User', serializer: UserSerializer
  belongs_to :receiver, class_name: 'User', serializer: UserSerializer
  attributes :id, :thx, :comment, :sender, :receiver, :created_at
end
