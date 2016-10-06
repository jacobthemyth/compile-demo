class RemoveColumnsFromPlaygrounds < ActiveRecord::Migration[5.0]
  def change
    remove_column :playgrounds, :html, :text
    remove_column :playgrounds, :css, :text
    remove_column :playgrounds, :js, :text
  end
end
