class CreateSlpLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :slp_logs do |t|
      t.integer :total, null: false
      t.references :scholar, null: false, index: true
      t.timestamps
    end
  end
end
