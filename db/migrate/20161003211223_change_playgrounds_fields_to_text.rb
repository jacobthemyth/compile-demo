class ChangePlaygroundsFieldsToText < ActiveRecord::Migration[5.0]
  def up
    change_table :playgrounds do |t|
      t.change :html, :text
      t.change :css, :text
      t.change :js, :text
    end
  end

  def down
    change_table :playgrounds do |t|
      t.change :html, :string
      t.change :css, :string
      t.change :js, :string
    end
  end
end
