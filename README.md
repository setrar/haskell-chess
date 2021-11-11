# haskell-chess

Simple, CLI-playable chess-engine.

This is a work in progress. For now, it features only an engine that tries to
take you as many pieces as possible (including your king), using the
alpha-beta algorithm.

## Features to be implemented:
* *en passant* capturing, castling;
* prevent the user from putting themselves in check;
* handle endgames properly by detecting draw and checkmate;
* improve the heuristic evaluation function to take more into account than the
  values of pieces.


## Using cabal

- [ ] Check the version

```
$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 8.10.7
```

- [ ] Run the application

```
cabal run
```

## Move Examples

- [ ] Knight moving from b1 to c3

```
input> b1c3
```

- [ ] More examples

[:point_right: Queen's Pawn Game](MOVE.md)


## Move and ChessBoard Class Reverse Engineering

- [ ] Launch the `repl`

```
cabal repl
```

- [ ] Do some reverse Engineering to understand the moves

```haskell
*CartesianProduct> :set prompt "GHCi > "
GHCi> import Move
GHCi> KingSideCastling Color.Black
kingside castling by Black
GHCi> import ChessBoard
GHCi> (Move (2,1) (2,3), Pawn)
(c2c4,p)
GHCi> (PawnPromotion (Move (3,6) (3,7)) King)
d7d8: pawn promoted to k
```

## Move Reads

- [ ] Trial and Error to get rid of `Input.hs` source code using `readMaybe` function

```haskell
GHCi> a <- getLine
"(Move (2,1) (2,3), Pawn)"
GHCi> a
"\"(Move (2,1) (2,3), Pawn)\""
GHCi> :type a
a :: String
GHCi>  reads a :: [(String,String)]
[("(Move (2,1) (2,3), Pawn)","")]
```

- [ ] Using `import Text.Read`, removing the need to use `Input.hs`

```
GHCi > readMaybe "\"(Move (2,1) (2,3), Pawn)\"" :: Maybe String
Just "(Move (2,1) (2,3), Pawn)"
GHCi > -- or using the Chess Board coordinates to make the moves
GHCi > readMaybe "\"c2c4\"" :: Maybe String
Just "c2c4"
```

# References

https://stackoverflow.com/questions/8689560/in-what-scenarios-does-haskells-reads-return-more-than-one-list-item

https://en.wikipedia.org/wiki/Algebraic_notation_(chess)


