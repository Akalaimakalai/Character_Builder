class Character < ApplicationRecord

  belongs_to :user

  validates :name, presence: true

  def creator?(user)
    user_id == user.id
  end
end
