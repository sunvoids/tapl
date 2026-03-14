import Control.Exception
import Data.Maybe (fromMaybe, isNothing)
-- Load in ghci:
-- :l arithmetic_expressions.hs

-- We create the equivalent of the simple grammar.
data Term 
  = TTrue
  | TFalse
  | TZero
  | Succ Term
  | Pred Term
  | IsZero Term
  | If Term Term Term
  deriving (Eq, Show)

isNumericVal :: Term -> Bool
isNumericVal TZero = True
isNumericVal (Succ t) = isNumericVal t
isNumericVal _ = False

isVal :: Term -> Bool
isVal TTrue = True
isVal TFalse = True
isVal t = isNumericVal t

-- Made this a Maybe Term returning func instead of Term
-- because it made eval quite ugly with how the exception
-- handling worked (I think this is also the answer to ex. 4.2.1)
eval1 :: Term -> Maybe Term
eval1 (If TTrue t2 t3) = Just t2
eval1 (If TFalse t2 t3) = Just t3
eval1 (If t1 t2 t3) =
  case eval1 t1 of
  Just t1' -> Just (If t1' t2 t3)
  Nothing -> Nothing
eval1 (Succ t1) =
  case eval1 t1 of
  Just t1' -> Just (Succ t1')
  Nothing -> Nothing
eval1 (Pred TZero) = Just TZero
eval1 (Pred (Succ nv1)) = if isNumericVal nv1 then Just nv1 else Nothing
eval1 (Pred t1) =
  case eval1 t1 of
  Just t1' -> Just (Pred t1')
  Nothing -> Nothing
eval1 (IsZero TZero) = Just TTrue
eval1 (IsZero (Succ nv1)) = if isNumericVal nv1 then Just TFalse else Nothing
eval1 (IsZero t1) =
  case eval1 t1 of
  Just t1' -> Just (IsZero t1')
  Nothing -> Nothing
eval1 _ = Nothing

eval :: Term -> Term
eval = until (isNothing . eval1) step
  where
    step t = fromMaybe t (eval1 t)

    
