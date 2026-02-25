Class new title: ↪BankAccount
     subclassof: Object
     fields: 'balance'
     declare: '';
     classified: 'Shoeisha himekuri'

init [balance ← 0]
balance ← balance
balance [⇑balance]
withdraw: amount
     [self balance < amount ⇒ [user notify: 'insufficient funds']
    self balance ← self balance - amount]
deposit: amount
     [self balance ← self balance + amount]

Class new title: ↪StockAccount
     subclassof: BankAccount
     fields: 'numShares pricePerShare'
     declare: '';
     classified: 'Shoeisha himekuri'

init [numShares ← 0. pricePerShare ← 30]
balance ← amount [numShares ← amount / pricePerShare]
balance [⇑numShares * pricePerShare]

| acc [acc ← BankAccount init balance ← 100. 
         acc deposit: 50; withdraw: 100; balance] "⇒ 50 "

| acc [acc ← StockAccount init balance ← 300. 
         acc deposit: 60; withdraw: 120; balance] "⇒ 240 