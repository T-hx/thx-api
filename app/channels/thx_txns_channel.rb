class ThxTxnsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "thx_txns_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
