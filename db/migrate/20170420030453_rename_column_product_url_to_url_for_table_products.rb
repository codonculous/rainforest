class RenameColumnProductUrlToUrlForTableProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :product_url, :product_img_url
  end
end
