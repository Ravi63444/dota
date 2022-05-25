class AddUseridColumnHerosTable < ActiveRecord::Migration[7.0]
  def change
    add_column :heros, :user_id, :int 
  end
end
