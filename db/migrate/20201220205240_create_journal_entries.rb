class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.string :date
      t.string :content
      t.integer :user_id
    end
  end
end
