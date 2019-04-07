# frozen_string_literal: true

class User < ActiveRecord::Base
  has_many :receivers,  class_name:  'ThxTxn',
           foreign_key: 'receiver_id', dependent: :nullify
  has_many :senders,  class_name:  'ThxTxn',
           foreign_key: 'sender_id', dependent: :nullify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
end
