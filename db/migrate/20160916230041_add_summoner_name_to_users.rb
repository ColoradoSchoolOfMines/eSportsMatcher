class AddSummonerNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :summoner_name, :string
  end
end
