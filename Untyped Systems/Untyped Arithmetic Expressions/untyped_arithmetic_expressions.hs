-- Load in ghci:
-- :l untyped_arithmetic_expressions.hs

-- We create the equivalent of the simple grammar.
data Term =
  TTrue
  | TFalse
  | TZero
  | Succ Term
  | Pred Term
  | IsZero Term
  | If Term Term Term
  deriving (Eq, Show)

constants :: [Term]
constants = [TTrue, TFalse, TZero]

-- Exercise 3.2.4
-- Recursively, we calculate the set of terms at S_n.
setElements :: Int -> [Term]
-- Our base cases. 
setElements 0 = []
setElements n = let
  previous = setElements $ pred n 
  in
  constants
    ++ [Succ x | x <- previous]
    ++ [Pred x | x <- previous]
    ++ [IsZero x | x <- previous]
    ++ [If x y z | x <- previous, y <- previous, z <- previous]

-- output:
-- ghci> length $ setElements 0
-- 0
-- ghci> length $ setElements 1
-- 3
-- ghci> length $ setElements 2
-- 39
-- ghci> length $ setElements 3
-- 59439
