require ('pry-byebug')
require_relative('./models/bounties.rb')

bounty1 = Bounties.new({
  "name" => "Davros",
  "species" => "Dalek",
  "bounty_value" => 100,
  "fav_weapon" => "Exterminator"
  })

  bounty2 = Bounties.new({
  "name" => "Darth Maul",
  "species" => "Sith",
  "bounty_value" => 80,
  "fav_weapon" => "Double Bladed Lightsaber"
    })

  bounty3 = Bounties.new({
  "name" => "Joker",
  "species" => "Human?",
  "bounty_value" => 50,
  "fav_weapon" => "Practical Jokes"
    })

bounty1.save()
bounty2.save()
bounty1.delete()
bounty2.bounty_value = 70
bounty2.update
p bounty2.find_by_name()
