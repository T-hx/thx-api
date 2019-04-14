class ThxTxnsController < ApplicationController
  # before_action :set_receiver, only: [:create]
  # before_action :authenticate_user!, except: [:new, :create]

  # GET /thx_txns
  def index
    thx_txns = ThxTxn.all
    render json: thx_txns
  end

  # POST /thx_txns
  def create
    @thx_txn = ThxTxn.new(thx_txn_params.merge({sender_id: current_user.id}))

    if thx_txn_save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ThxTxnSerializer.new(@thx_txn)
      ).serializable_hash
      ActionCable.server.broadcast 'thx_txns_channel', serialized_data
      head :ok
      broadcast_sender
      broadcast_receiver
    end
  end

  private
    def thx_txn_save
      @receiver = @thx_txn.receiver
      ApplicationRecord.transaction do
        @thx_txn.save!
        current_user.update!(thx_balance: (current_user.thx_balance - @thx_txn.thx.to_i))
        @receiver.update!(received_thx: (@receiver.received_thx + @thx_txn.thx.to_i))
      end
      true
    rescue ActiveRecord::RecordInvalid
      false
    end

    def broadcast_sender
      sender_serialized_data = ActiveModelSerializers::Adapter::Json.new(
        UserSerializer.new(current_user)
      ).serializable_hash
      ActionCable.server.broadcast "users_#{current_user.id}", sender_serialized_data
      head :ok
    end

  def broadcast_receiver
    receiver_serialized_data = ActiveModelSerializers::Adapter::Json.new(
      UserSerializer.new(@receiver)
    ).serializable_hash
    ActionCable.server.broadcast "users_#{@receiver.id}", receiver_serialized_data
    head :ok
  end
    # Only allow a trusted parameter "white list" through.
    def thx_txn_params
      params.require(:thx_txn).permit(:thx, :comment, :receiver_id)
    end
end

