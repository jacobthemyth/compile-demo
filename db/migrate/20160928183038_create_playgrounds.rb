class CreatePlaygrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :playgrounds do |t|

      t.timestamps
    end
  end
end
