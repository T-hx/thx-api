class ThxTxnsController < ApplicationController
  # before_action :set_thx_txn, only: [:show]
  # before_action :authenticate_user!

  # GET /thx_txns
  def index
    thx_txns = ThxTxn.all
    render json: thx_txns
  end

  # POST /thx_txns
  def create
    thx_txn = ThxTxn.new(thx_txn_params)

    if thx_txn.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ThxTxnSerializer.new(thx_txn)
      ).serializable_hash
      ActionCable.server.broadcast 'thx_txns_channel', serialized_data
      # render json: @thx_txn, status: :created, location: @thx_txn
      head :ok
    # else
    #   render json: @thx_txn.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def thx_txn_params
      params.require(:thx_txn).permit(:thx, :comment, :sender, :receiver)
    end
end

