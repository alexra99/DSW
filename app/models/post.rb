class Post < ApplicationRecord
    belongs_to :user
    belongs_to :collect, optional: true
end
