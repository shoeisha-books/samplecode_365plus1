to bankaccount x : balance : transaction
    (isnew ⇒ (:balance)
    ∢balance ⇒ (∢← ⇒ (⇑:balance) ⇑balance)
    ☞x ← transaction SELF GLOB MESS.
    eq #x #SELF ⇒ () ⇑x) ！

to stockaccount x : numshares pricepershare : transaction
    (isnew ⇒ (☞pricepershare ← 30. ☞numshares ← (:) / pricepershare)
    ∢balance ⇒ ((∢← ⇒ (☞numshares ← (:) / pricepershare)) ⇑numshares * pricepershare)
    ∢numshares ⇒ (⇑numshares)
    ☞x ← transaction SELF GLOB MESS. 
    eq #x #SELF ⇒ () ⇑x) ！

to t transaction (ev). t ！
to transaction x
    (:#SELF. :x. :MESS. ☞GLOB ← x.
    ∢deposit ⇒ (⇑SELF balance ← SELF balance + :)
    ∢withdraw ⇒ (:x > SELF balance ⇒ (error ☞(insufficient funds))
        ⇑SELF balance ← SELF balance - x)) ！
PUT bankaccount ☞transaction #transaction ！
PUT stockaccount ☞transaction #transaction ！
done ！

☞acc1 ← bankaccount 100. acc1 deposit 50. acc1 withdraw 100 ！=> 50
☞acc2 ← stockaccount 300. acc2 deposit 60. acc2 withdraw 120 ！=> 240