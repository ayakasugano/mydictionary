class RenameClassColumnToWords < ActiveRecord::Migration[7.0]
  def change
    rename_column :words, :class, :word_class
  end
end
