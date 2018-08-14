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
  def save()
    db = PG.connect({dbname: 'spacecowboys', host: 'localhost'})
    sql = "INSERT INTO bounties (name, species, bounty_value, fav_weapon)
    VALUES
    ($1, $2, $3, $4) RETURNING *"
    values = [@name, @species, @bounty_value, @fav_weapon]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i()
    db.close()
  end

  def update()
    db = PG.connect({dbname: 'spacecowboys', host: 'localhost'})
    sql = "UPDATE bounties
    SET(name, species, bounty_value, fav_weapon)
    = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@name, @species, @bounty_value, @fav_weapon, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close

  end

  def delete()
    db = PG.connect({dbname: 'spacecowboys', host: 'localhost'})
    sql = "DELETE FROM bounties WHERE id = $1"
    values = [@id]
    db.prepare("delete", sql)
    db.exec_prepared("delete", values)
    db.close

  end

  def Bounty.find_by_name(name)
    db = PG.connect({dbname: 'spacecowboys', host: 'localhost'})
    sql = "SELECT * FROM bounties WHERE name = $1"
    values = [name]
    db.prepare("find_by_name", sql)
    name_found = db.exec_prepared("find_by_name", values)
    db.close
    return name_found.map { |name|
    Bounties.new(name) }

  end


end
