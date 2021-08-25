class Post < ApplicationRecord
  belongs_to :user

  has_many :post_attachments, dependent: :destroy, inverse_of: :post
  accepts_nested_attributes_for :post_attachments, allow_destroy: true, reject_if: :all_blank

  enum status: {
    draft: 0,
    submitted: 1,
    approved: 2
  }
end
