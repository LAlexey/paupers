class RenameTicketsStartedAtToDate < ActiveRecord::Migration
  def change
    rename_column :tickets, :start_at, :date
    change_column :tickets, :date, :date, null: false
  end
end
