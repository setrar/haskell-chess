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

```
$ ghc --version
The Glorious Glasgow Haskell Compilation System, version 8.10.7
```

```
cabal run
```


## Read

```haskell
GHCi> a <- getLine
"Move d1 d2"
GHCi> :type a
a :: String
GHCi>  reads a :: [(String,String)]
[("Move d1 d2","")]
```

# References

https://stackoverflow.com/questions/8689560/in-what-scenarios-does-haskells-reads-return-more-than-one-list-item



