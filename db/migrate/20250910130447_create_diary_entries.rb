class CreateDiaryEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :diary_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.text :body
      t.integer :mood
      t.date :walked_on

      t.timestamps
    end
  end
end
