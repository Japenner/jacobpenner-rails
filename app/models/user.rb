# frozen_string_literal: true

class User < ApplicationRecord
  has_one :profile, foreign_key: :user_id, inverse_of: :user

  has_many :curriculum_vitaes, through: :profile

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
