class AddStateToQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :state, :string, :default => 'pending'
    remove_column :quotes, :approved, :boolean
    remove_column :quotes, :bioreactored, :boolean
  end
end
