class AddCssToPlaygrounds < ActiveRecord::Migration[5.0]
  def change
    add_column :playgrounds, :css, :string
  end
end
