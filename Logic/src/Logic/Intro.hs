module Logic.Intro where

data Expression = Var String
                | Const Int
                | Add Expression Expression
                | Mul Expression Expression
                deriving (Eq, Show)

simplify1 :: Expression -> Expression
simplify1 (Add (Const m) (Const n)) = Const (m + n)
simplify1 (Mul (Const m) (Const n)) = Const (m * n)
simplify1 (Add (Const 0) x)         = x
simplify1 (Add x (Const 0))         = x
simplify1 (Mul (Const 0) x)         = Const 0
simplify1 (Mul x (Const 0))         = Const 0
simplify1 (Mul (Const 1) x)         = x
simplify1 (Mul x (Const 1))         = x
simplify1 x                         = x

simplify :: Expression -> Expression
simplify (Add e1 e2) = simplify1 (Add (simplify e1) (simplify e2))
simplify (Mul e1 e2) = simplify1 (Mul (simplify e1) (simplify e2))
simplify e           = simplify1 e

