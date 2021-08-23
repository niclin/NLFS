class Post < ApplicationRecord

  enum statsu: {
    disable: 0,
    enable: 1
  }
end
