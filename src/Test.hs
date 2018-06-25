module Test (
    -- main
) where

import Data.Char
import System.Process

clear = system "clear"

selectOption :: Char -> [IO ()] -> IO ()
selectOption c fs
    | opt > max =
    | otherwise =
    where
        opt = ord c - 49
        max = length fs - 1

page1 :: IO ()
page1 = do
    putStrLn "### Page 1 ###"
    putStrLn "1 - page2"
    putStrLn "2 - page3"
    selected <- getChar
    clear
    selectOption selected [page2, page3]
    return ()

page2 :: IO ()
page2 = do
    putStrLn "### Page 2 ###"
    putStrLn "1 - page1"
    putStrLn "2 - page3"
    selected <- getChar
    clear
    selectOption selected [page1, page3]
    return ()

page3 :: IO ()
page3 = do
    putStrLn "### Page 3 ###"
    putStrLn "1 - page1"
    putStrLn "2 - page2"
    selected <- getChar
    clear
    selectOption selected [page1, page2]
    return ()


main :: IO ()
main = do
    clear
    page1
