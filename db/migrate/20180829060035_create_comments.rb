class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :posting_id
      t.text    :text
      t.timestamps
    end
  end
end
