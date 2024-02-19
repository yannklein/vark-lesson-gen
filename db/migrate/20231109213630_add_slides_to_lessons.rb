class AddSlidesToLessons < ActiveRecord::Migration[7.0]
  def change
    add_column :lessons, :slides, :string,  array: true
  end
end