# frozen_string_literal: true

# Article
class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5 }
end