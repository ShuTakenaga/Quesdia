class AddImgToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :img, :string
  end
end
