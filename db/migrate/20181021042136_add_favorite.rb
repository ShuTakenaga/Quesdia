class AddFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :favorite, :boolean, default: false
  end
end
