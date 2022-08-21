firstOrEmpty :: [[Char]] -> [Char]
firstOrEmpty lst = if not (null lst) then head lst else "empty"

(+++) :: [a] -> [a] -> [a]
[]     +++ lst2 = lst2
(x:xs) +++ lst2 = x:(xs +++ lst2)

reverse2 :: [a] -> [a]
reverse2 list = if null list then [] else reverse2 (tail list) +++ [head list]

maxmin :: Ord a => [a] -> (a, a)
maxmin []     = error "Invalid value"
maxmin [x]    = (x,x)
maxmin (x:xs) =  ( if x > xs_max then x else xs_max
                 , if x < xs_min then x else xs_min
                 ) where (xs_max, xs_min) = maxmin xs 

data Client = GovOrg     String
            | Company    String Integer Person String
            | Individual Person Bool
            deriving Show

data Person = Person String String Gender
            deriving Show

data Gender = Male | Female | Unknown
            deriving (Show, Eq)

clientName :: Client -> String
clientName client = case client of
                      GovOrg     name                 -> name
                      Company    name _ _ _           -> name
                      Individual (Person fNm lNm _) _ -> fNm ++ " " ++ lNm

companyName :: Client -> Maybe String
companyName client = case client of
                       Company name _ _ _ -> Just name
                       _                  -> Nothing

fibonacci :: Integer -> Integer
fibonacci n = case n of
                0 -> 0
                1 -> 1
                _ -> fibonacci (n - 1) + fibonacci (n - 2)

listOfClients :: [Client]
listOfClients = [
    Company "Apple" 10000 (Person "Peter" "Pan" Male) "Staff",
    Company "Apple" 10000 (Person "Susan" "Hunter" Female) "Boss",
    Individual (Person "Stephan" "Schulte" Male) False,
    GovOrg "FBI"]


genderOfClient :: Client -> Maybe Gender
genderOfClient (Company _ _ (Person _ _ gender) _) = Just gender
genderOfClient (Individual (Person _ _ gender) _)  = Just gender
genderOfClient (GovOrg _)                          = Nothing

countGenderHelper :: [Client] -> (Int, Int) -> (Int, Int)
countGenderHelper [] res = res
countGenderHelper (x:xs) res = if (genderOfClient x) == Nothing then countGenderHelper xs res else
                                  if (genderOfClient x) == (Just Male) then countGenderHelper xs (fst res + 1, snd res)
                                  else countGenderHelper xs (fst res, snd res + 1)

countGender :: [Client] -> (Int, Int)
countGender lst = countGenderHelper lst (0,0)

data Direction = Past | Future | Both
                 deriving Show

-- A time machine is defined by:
--                             Manifacturer
--                                    Model
--                                        Name   PastOrFuture
--                                                         Price
data TimeMachine = TimeMachine String Int String Direction Float
                   deriving Show

timeMachines :: [TimeMachine]
timeMachines = [
    TimeMachine "FutureTech" 1 "Future 2000" Future 1000000.00,
    TimeMachine "FutureTech" 2 "Future 1000" Future 700000.00,
    TimeMachine "Antics" 3 "ChangeIt 1" Future 7000000.00,
    TimeMachine "Antics" 4 "ChangeIt 2" Future 8000000.00,
    TimeMachine "Global World Tech" 5 "Desaster 1" Both 80000000.00]

discountTimeMachines:: [TimeMachine] -> Float -> [TimeMachine]
discountTimeMachines [] _ = []
discountTimeMachines ((TimeMachine man model name dir price):xs) d = 
    (TimeMachine man model name dir (price*(100.0 - d)/100.00)) :
       (discountTimeMachines xs d)

--
--discountTimeMachines timeMachines 10.0

sorted :: [Integer] -> Bool
sorted []          = True
sorted [_]         = True
sorted (x:r@(y:_)) = x < y && sorted r

-- sorted [1,2,3,4,5]
-- sorted [2,3,4,5,1]








