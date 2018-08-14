require('pg')

class Bounties

attr_reader(:id)
attr_accessor(:name, :species, :bounty_value, :fav_weapon)

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @species = options["species"]
    @bounty_value = options["bounty_value"].to_i
    @fav_weapon = options["fav_weapon"]

  end
end
