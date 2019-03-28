class ThxTxnsController < ApplicationController
  before_action :set_thx_txn, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /thx_txns
  def index
    @thx_txns = ThxTxn.all

    render json: @thx_txns
  end

  # GET /thx_txns/1
  def show
    render json: @thx_txn
  end

  # POST /thx_txns
  def create
    @thx_txn = ThxTxn.new(thx_txn_params)

    if @thx_txn.save
      render json: @thx_txn, status: :created, location: @thx_txn
    else
      render json: @thx_txn.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /thx_txns/1
  def update
    if @thx_txn.update(thx_txn_params)
      render json: @thx_txn
    else
      render json: @thx_txn.errors, status: :unprocessable_entity
    end
  end

  # DELETE /thx_txns/1
  def destroy
    @thx_txn.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thx_txn
      @thx_txn = ThxTxn.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def thx_txn_params
      params.require(:thx_txn).permit(:thx, :comment, :sender, :receiver)
    end
end

