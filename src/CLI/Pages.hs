module CLI.Pages (
    clear,
    page1,
    page2,
    page3
) where

import Data.Char
import Utils.System

selectOption :: [IO ()] -> IO ()
selectOption fs = do
    c <- getChar
    getChar -- discard enter
    let opt = ord c - 49
        max = length fs - 1
    if opt < 0 then
        putStrLn "lorem ipsum"
    else if opt > max then
        putStrLn "dolor sit"
    else do
        clear
        fs !! opt

page1 :: IO ()
page1 = do
    putStrLn "### Page 1 ###"
    putStrLn "1 - page2"
    putStrLn "2 - page3"
    selectOption [page2, page3]
    return ()

page2 :: IO ()
page2 = do
    putStrLn "### Page 2 ###"
    putStrLn "1 - page1"
    putStrLn "2 - page3"
    selectOption [page1, page3]
    return ()

page3 :: IO ()
page3 = do
    putStrLn "### Page 3 ###"
    putStrLn "1 - page1"
    putStrLn "2 - page2"
    selectOption [page1, page2]
    return ()
