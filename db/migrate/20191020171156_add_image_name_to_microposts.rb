class AddImageNameToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :image_name, :string
  end
end
