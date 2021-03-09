module Chapter2.DataTypes where

data Client = GovOrg  String
            | Company    String Integer Person String
            | Individual Person Bool
            deriving Show 
            
data Person = Person String String Gender
            deriving Show 
            
data Gender = Male | Female | Unknown
            deriving Show

data Direction = Future | Past | Both
               deriving Show

-- Timemachine manufacturer model name future_past price
data TimeMachine = TimeMachine String Integer String Direction Double
     deriving Show            

clientName :: Client -> String
clientName (GovOrg name) = name
clientName (Company name _ _ _) = name
clientName (Individual (Person fNm lNm _ ) _) = fNm ++ " " ++ lNm

clientSex :: [Client] -> (Int, Int, Int)
clientSex lst = 
    let
        isMale (Individual (Person _ _ Male) _) = True
        isMale _ = False
        isFemale (Individual (Person _ _ Female) _) = True
        isFemale _ = False 
        isUnknown (GovOrg _) = True
        isUnknown (Company _ _ _ _) = True 
        isUnknown (Individual (Person _ _ Unknown) _) = True
        isUnknown _ = False
        noOfMen = length (filter isMale lst)
        noOfWomen = length (filter isFemale lst)
        noOfUnknown = length (filter isUnknown lst)
    in 
        (noOfMen, noOfWomen, noOfUnknown)

decreasePrice :: Double -> [TimeMachine] -> [TimeMachine]
decreasePrice disc lst = let
                        discount disc (TimeMachine manufacturer model name direction price) = TimeMachine manufacturer model name direction (price * disc)
                   in
                        map (discount disc) lst

