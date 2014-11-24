class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :note_id
      t.integer :author_id
      t.string :weather
      t.string :date
      t.text :body

      t.timestamps
    end
  end
end
