class Post < ApplicationRecord
  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments

  enum statsu: {
    disable: 0,
    enable: 1
  }
end
