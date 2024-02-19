class CreateLessons < ActiveRecord::Migration[7.0]
  def change
    create_table :lessons do |t|
      t.string :name
      t.string :content
      t.text :transcripts, array: true
      t.timestamps
    end
  end
end