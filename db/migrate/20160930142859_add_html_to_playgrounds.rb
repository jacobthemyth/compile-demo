class AddHtmlToPlaygrounds < ActiveRecord::Migration[5.0]
  def change
    add_column :playgrounds, :html, :string
  end
end
