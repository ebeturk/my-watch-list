class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6, message: "Your comment must be at least 6 characters long." }
  validates :movie, uniqueness: { scope: :list, message: "this movie is already in the list" }
end
