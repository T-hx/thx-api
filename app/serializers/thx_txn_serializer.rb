class ThxTxnSerializer < ActiveModel::Serializer
  attributes :id, :thx, :comment, :sender, :receiver, :created_at
end
