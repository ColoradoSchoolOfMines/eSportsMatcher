class AddSummonerToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :summoner, foreign_key: true
  end
end
