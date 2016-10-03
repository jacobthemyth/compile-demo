class AddJsToPlaygrounds < ActiveRecord::Migration[5.0]
  def change
    add_column :playgrounds, :js, :string
  end
end
