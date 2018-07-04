module CLI.Inputs (
    selectOption
) where

import Utils.System
import Data.Char

{- selectOption
 - Receives an array of IO () and collect an input from the user, then executes
 - the function in that index.
 - Ex.: `selectOption [foo, bar]` will execute foo if `user` enters '0' and
 - `bar` if enters '1'
 -}
selectOption :: [IO ()] -> IO ()
selectOption fs = do
    c <- getChar
    getChar -- discard enter
    let opt = ord c - 48
        max = length fs - 1
    if opt < 0 then
        putStrLn "lorem ipsum"
    else if opt > max then
        putStrLn "dolor sit"
    else do
        clear
        fs !! opt