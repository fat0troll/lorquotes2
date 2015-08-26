class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :trivia
      t.string :author
      t.datetime :writedate
      t.string :link
      t.boolean :approved, :default => false
      t.integer :approver_id

      t.timestamps null: false
    end
  end
end
