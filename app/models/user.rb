class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :diary_entries, dependent: :destroy

  has_many :walk_records, dependent: :destroy
  has_many :puzzles, dependent: :destroy
end
