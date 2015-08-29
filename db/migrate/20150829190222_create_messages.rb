class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :author_id, :default => 0
      t.boolean :approved, :default => true
      t.string :useragent, null: false
      t.timestamps null: false
    end
  end
end
