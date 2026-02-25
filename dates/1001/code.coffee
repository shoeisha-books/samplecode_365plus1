class Coffee
    constructor: (@name, @price) ->

    info: -> "#{@name} - $#{@price}"

class Order
    constructor: -> @items = []

    add: (coffee) -> @items.push coffee

    total: -> @items.reduce ((sum, i) -> sum + i.price), 0

    summary: ->
        console.log "=== Your Order ==="
        for item in @items
            console.log "#{item.info()}"
        console.log "Total - $#{@total()}"
        console.log "=================="

menu = [
    new Coffee("Espresso", 3), new Coffee("Latte", 4),
    new Coffee("Cappuccino", 5), new Coffee("Mocha", 6)
]

order = new Order()
order.add menu[1]
order.add menu[3]
order.summary()
