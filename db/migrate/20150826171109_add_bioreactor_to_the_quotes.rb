class AddBioreactorToTheQuotes < ActiveRecord::Migration
  def change
    add_column :quotes, :bioreactored, :boolean, :default => false
    add_column :quotes, :bioreactor_reason, :string
  end
end
