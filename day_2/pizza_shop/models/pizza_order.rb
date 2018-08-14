require('pg')

class PizzaOrder

  attr_accessor :first_name, :last_name, :quantity, :topping
  attr_reader :id

  def initialize(options)
    @id = options ['id'].to_i if options['id']
    @first_name = options ['first_name']
    @last_name = options ['last_name']
    @quantity = options ['quantity'].to_i
    @topping = options ['topping']
  end

  def save()
    db = PG.connect({ dbname: 'pizza_shop', host: 'localhost'})
    sql = "INSERT INTO pizza_orders
          (first_name, last_name, quantity, topping)
          VALUES
          ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @quantity, @topping]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]['id'].to_i
    db.close()
  end

  def PizzaOrder.all()
    db = PG.connect({dbname: 'pizza_shop', host:'localhost'})
    sql = "SELECT * FROM pizza_orders"
    db.prepare("all", sql)
    orders = db.exec_prepared("all")
    db.close()
    return orders.map { |order|
      PizzaOrder.new(order) }
  end
end
