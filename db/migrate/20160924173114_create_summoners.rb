class CreateSummoners < ActiveRecord::Migration[5.0]
  def change
    create_table :summoners do |t|
      t.integer :riot_id
      t.string :name
      t.integer :profileIconId
      t.integer :summonerLevel
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
