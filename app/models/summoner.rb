class Summoner < ApplicationRecord
  belongs_to :user

  # TODO: Would this be more appropriate in the summoner controller?
  # I think we will typically call this function from the user controller
  # through a reference to a User, so I think it makes sense to have these
  # functions in the model class but I'm not an expert in Rails
  # styles/practices
  def get_stats
    return @player_stats_json
  end

  def update
    # If we last updated_at more than 8 hours ago
    if updated_at < 8.hours.ago
    # which means that timestamp is less than the timestamp for 8 hours ago
      # TODO: TEST THIS! But I'm not sure how, because I can't assert a change in the stats and I'm not sure if there is a way to see the requests HTTParty is making from a test class
      pull_summoner_data
      update_stats
    end
    get_stats
  end

  private

    def pull_summoner_data
      return if name.nil?
      url = "https://na.api.pvp.net/api/lol/na/v1.4/summoner/by-name/#{name}?api_key=#{ENV['riot_api_key']}"
      key = name.downcase
      json = HTTParty.get(url)[key]
      unless json.nil?
        level = json["summonerLevel"]
        profileIcon = json["profileIconId"]
        riot_id = json["id"]
        # TODO: we should also probably pull summoner data upon registration and reject the POST if we get a reject code back (e.g. 404, 403, etc.)
        update_attribute(:summonerLevel, level)
        update_attribute(:profileIconId, profileIcon)
        update_attribute(:riot_id, riot_id)

        update_stats

        return self
      end
    end

    def update_stats
      return if riot_id.nil?
      url = "https://na.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/#{riot_id}/summary?api_key=#{ENV['riot_api_key']}"
      json = HTTParty.get(url)
      # TODO: persist these stats to the database
      # Maybe also filter out some uninteresting stats
      @player_stats_json = json['playerStatSummaries']
    end

end
