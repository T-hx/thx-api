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
    thx_txn = ThxTxn.new(thx_txn_params.merge({sender_id: current_user.id}))

    if thx_txn.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ThxTxnSerializer.new(thx_txn)
      ).serializable_hash
      ActionCable.server.broadcast 'thx_txns_channel', serialized_data
      head :ok
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def thx_txn_params
      params.require(:thx_txn).permit(:thx, :comment, :receiver_id)
    end
end

