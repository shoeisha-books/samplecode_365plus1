module Main where

data Ingredient = Rice | Meat | Onion | Potato | Carrot | Spice
    deriving (Show, Eq)

type Curry = [Ingredient]

cook :: [Ingredient] -> Curry
cook = id

serve :: Curry -> String
serve ing = "Today's Curry contains: " ++ unwords (map show ing)

baseCurry :: [Ingredient] -> Curry
baseCurry extra = cook (Rice : Spice : extra)

beefCurry, vegCurry :: Curry
beefCurry = baseCurry [Meat, Onion, Potato]
vegCurry  = baseCurry [Onion, Carrot, Potato]

withExtra :: Ingredient -> Curry -> Curry
withExtra x c = c ++ [x]

main :: IO ()
main = do
    putStrLn $ serve beefCurry
    putStrLn $ serve (withExtra Meat vegCurry)
    putStrLn $ serve (withExtra Onion (withExtra Carrot beefCurry))
