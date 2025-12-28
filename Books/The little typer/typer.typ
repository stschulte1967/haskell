#set page(
  paper: "a5",
  margin: 2cm,
  header: "The Little Typer",
)

#let axiom(title, body) = {
[
  *#title* \ 
  #body
]}

= The Little Typer

== The More Things Change,\ the More They Stay the Same

#axiom("The Law of Tick Marks", [A tick mark directly followed by one or more letters and hyphens is an _Atom_.])

#axiom("The Commandment of Tick Marks", [Two expressions are the same _Atom_ if their values are tick marks followed by identical letters and hyphens.])

#axiom("The Law of Atom", [_Atom_ is a type.])

#axiom("The Four Forms of Judgement", [
    #table(
        columns: 2,
        [1. ... is a ...],
        [2. ... is the same ... as ...],
        [3. ... is a type.],
        [4. ... and ... are the same type.],
    )
])

#axiom("Normal Forms", [Given a type, every expression described by that type has a _normal form_, which is the most direct way of writing it. If two expressions are the same, then they have identical normal forms, and if they have identical normal forms, then they are the same.])

#axiom("Normal Forms and Types", [Sameness is always according to a type, so normal forms are also determined by a type.])

#axiom("The First Commandment of cons", [Two cons-expressions are the same `(Pair A D)` if their cars are the same `A` and their cdrs are the same `D`. Here, `A` and `D` stand for any type.])

#axiom("Normal Forms of Types", [Every expression that is a type has a normal form, which is the most direct way of writing that type. If two expressions are the same type, then they have identical normal forms, and if two types have identical normal forms, then they are the same type.])

#axiom("Claims before Definitions", [Using `define` to associate a name with an expression requires that the expression's type has previously been associated with the name using `claim`.])

#axiom("Values", [An expression with a constructor at the top is called a _value_.])

#axiom("Values and Normal Forms", [Not every value is in normal form. This is because the arguments to a constructor need not be normal. Each expression has only one normal form, but it is sometimes possible to write it as a value in more than one way.])

#axiom("Everything is an Expression", [In Pie, values are also expressions. Evaluation in Pie finds an expression, not some other kind of thing.])

#axiom("The Commandment of zero", [_zero_ is the same Nat as _zero_.])

#axiom("The Commandment of add1", [If $n$ is the same Nat as $k$, then `(add1 n)` is the same Nat as `(add1 k)`.])

#axiom("Definitions are Forever", [Once a name has been claimed, it cannot be reclaimed, and once a name has been defined it cannot be redefined.])

== Doin' What Comes Naturally

#axiom("Constructors and Eliminators", [Constructors build values, and eliminators take apart values built by constructors.])

#axiom("Eliminating Functions", [Applying a function to arguments is the eliminator for functions.])

#axiom("The Initial Law of Application", [If `f` is an `(-> Y X)` and `arg` is a `Y`, then `(f arg)` is an `X`.])

#axiom("The Initial First Commandment of lambda", [Two lambda-expressions that expect the same number of arguments are the same if their bodies are the same after consistently renaming their variables.])

#axiom("The Initial Second Commandment of lambda", [If `f` is an `(-> Y X)`, then `f` is the same `(-> Y X)` as `(lambda (y) (f y))`, as long as `y` does not occur in `f`.])

#axiom("The Law of Renaming Variables", [Consistently renaming variables cannot change the meaning of anything.])

#axiom("The Commandment of Neutral Expressions", [Neutral expressions that are written identically are the same, no matter their type.])

#axiom("The Law and Commandment of define", [Following `(claim name X)` and `(define name expr)`, if `expr` is an `X`, then `name` is an `X` and `name` is the same `X` as `expr`.])

#axiom("The Second Commandment of cons", [If `p` is a `(Pair A D)`, then it is the same `(Pair A D)` as `(cons (car p) (cdr p))`.])

#axiom("Names in Definitions", [In Pie, only names that are not already used, whether for constructors, eliminators, or previous definitions, can be used with `claim` or `define`.])

#axiom("Dim Names", [Unused names are written dimly, but they do need to be there.])

#axiom("The Law of which-Nat", [
    If `target` is a Nat, `base` is an `X`, and `step` is an `(-> Nat X)`, then
    ```scheme
    (which-Nat target
        base
        step)
    ```
    is an `X`.
])

#axiom("The First Commandment of which-Nat", [If `(which-Nat zero base step)` is an `X`, then it is the same `X` as `base`.])

#axiom("The Second Commandment of which-Nat", [If `(which-Nat (add1 n) base step)` is an `X`, then it is the same `X` as `(step n)`.])

#axiom("Type Values", [An expression that is described by a type is a value when it has a constructor at its top. Similarly, an expression that is a type is a value when it has a type constructor at its top.])

#axiom("Every U is a Type", [Every expression described by `U` is a type, but not every type is described by `U`.])

#axiom("Definitions are Unnecessary", [Everything can be done without definitions, but they do improve understanding.])

=== Code
```scheme
#lang Pie

(claim Pear-maker U)

(define Pear-maker
    (-> Nat Nat Pear))

(claim elim-Pear
    (-> Pear Pear-maker Pear))

(define elim-Pear
    (lambda (pear maker)
        (maker (car pear)
               (cdr pear))))

(claim pearwise+
    (-> Pear Pear Pear))

(define pearwise+ 
    (lambda (anjous bosc)
        (elim-Pear anjous 
            (lambda (a1 d1)
                (elim-Pear bosc 
                    (lambda (a2 d2)
                        (cons (+ a1 a2)
                              (+ d1 d2))))))))
```
=== Proofs
```
(pearwise+ (cons 3 8) (cons 7 6))

(lambda anjous bosc
    (elim-Pear anjous 
        (lambda (a1 d1)
            (elim-Pear bosc 
                (lambda (a2 d2)
                    (cons (+ a1 a2)
                          (+ d1 d2)))))) 
                          (cons 3 8)
                            (cons 7 6))

(elim-Pear (cons 3 8) 
    (lambda (a1 d1)
        (elim-Pear (cons 7 6) 
            (lambda (a2 d2)
                (cons (+ a1 a2)
                (+ d1 d2))))))


 
```



