class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :note_id
      t.string :integer
      t.string :author_id
      t.string :integer
      t.string :weather
      t.string :string
      t.string :date
      t.string :string
      t.string :body
      t.string :text

      t.timestamps
    end
  end
end
