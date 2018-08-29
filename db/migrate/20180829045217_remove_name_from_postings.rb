class RemoveNameFromPostings < ActiveRecord::Migration
  def change
    remove_column :postings, :name, :string
  end
end
