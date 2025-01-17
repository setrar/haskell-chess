import ChessBoard (ChessBoard, initialPosition)
import Move ( Move )
import ChessRules (legal,doMove)
import Color ( Color(White) )
import Decisions ( advantage, bestMove )
import System.IO (hFlush, stdout)
import Text.Read ( readMaybe )

depth :: Int
depth = 3

main :: IO ()
main = game initialPosition

-- | Play a game by interacting with an opponent, starting from a given
-- situation. The opponent does the first move.
game :: ChessBoard -> IO ()
game cb = do
   print cb
   putStr "input> "
   hFlush stdout
   cmd <- getLine
   execute cb cmd

execute :: ChessBoard -> String -> IO ()
execute _ "quit" = putStrLn "Bye!"
execute cb "eval" = do
   print $ advantage White depth cb
   game cb
execute cb str = case readMaybe str :: Maybe Move of
   Nothing -> putStrLn "Invalid input." >> game cb
   Just m -> if not $ legal cb m
             then putStrLn "Illegal move." >> game cb
             else do
               let cb' = doMove cb m
               print cb'
               putStrLn "I'm thinking..."
               let myMove = bestMove depth cb'
                   cb''   = doMove cb' myMove
               putStrLn $ "My move: " ++ show myMove
               game cb''
   
