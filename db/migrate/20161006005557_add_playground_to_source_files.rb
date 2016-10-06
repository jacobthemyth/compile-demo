class AddPlaygroundToSourceFiles < ActiveRecord::Migration[5.0]
  def change
    add_reference :source_files, :playground, foreign_key: true
  end
end
