import Logic.Intro
import Test.Tasty
import Test.Tasty.HUnit

main :: IO ()
main = do
    defaultMain (testGroup "Basic tests" [constructExpression, simplifyExpression])

constructExpression :: TestTree
constructExpression = testCase "Construct Expression" (do
    let test = Add (Mul (Const 2) (Var "x")) (Var "x")
    assertBool "data structure Expression can be created" True)

simplifyExpression :: TestTree
simplifyExpression = testCase "Simplify Expression"
    (assertEqual " simple simplification works" (simplify (Add (Mul (Add (Mul (Const 0) (Var "x")) (Const 1)) (Const 3)) (Const 12))) (Const 15))




