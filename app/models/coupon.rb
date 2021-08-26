class Coupon < ApplicationRecord
  include AASM

  enum using_state: {
    initial: 0,
    complete: 1
  }

  belongs_to :user, optional: true

  before_create :generate_code

  aasm column: :using_state, enum: true do # defaults to aasm_state
    state :initial, initial: true
    state :complete

    event :complete do
      transitions to: :complete, from: [:initial]
    end
  end

  scope :recent, -> { order(id: :desc) }

  private

  def generate_code
    self.code = SecureRandom.hex(4).upcase
  end
end
