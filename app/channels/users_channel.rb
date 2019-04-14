class UsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users_#{params[:user_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
