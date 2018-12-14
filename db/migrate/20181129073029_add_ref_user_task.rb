# frozen_string_literal: true

# AddRefUserArticle
class AddRefUserTask < ActiveRecord::Migration[5.2]
  def change
    add_reference :tasks, :user, foreign_key: true
  end
end
