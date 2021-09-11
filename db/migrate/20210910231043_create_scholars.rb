class CreateScholars < ActiveRecord::Migration[6.1]
  def up
    create_table :scholars do |t|
      t.string :discord_name
      t.string :ronin_wallet_id
      t.timestamps
    end

    execute <<-SQL
      INSERT INTO scholars (
        discord_name, 
        ronin_wallet_id, 
        updated_at, 
        created_at
      )
      VALUES
      (
        'jpc',
        '0x79028e8987642e3898cfbcb212f7dbc166047588',
        DATETIME(),
        DATETIME()
      ),
      (
        'tyler',
        '0x8b27daa7acfb16e16e412a3e1f632f17d69d4d6b',
        DATETIME(),
        DATETIME()
      )
    SQL
  end

  def down
    drop_table :scholars
  end
end
