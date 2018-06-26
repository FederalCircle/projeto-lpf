module CLI.Layout (
    optionsLayout,
    headerLayout
) where

import Data.Char

{- optionsLayout
 - Prints the layout one page options
 - Ex:
 - ghci> optionsLayout ["opt1", "opt2"]
   0 - opt1
   1 - opt2
 -}
optionsLayout :: [String] -> IO ()
optionsLayout labels = aux 0 labels
    where
        aux _ [] = putChar '\n'
        aux index (label : ls) = do
            putStrLn $ show index ++ " - " ++ label
            aux (index + 1) ls

{- headerLayout
 - Prints the layout one page title
 - Ex:
 - ghci> headerLayout "Title"
   ***************
   *             *
   *    Title    *
   *             *
   ***************
 -}
headerLayout :: String -> IO ()
headerLayout title = putStrLn $ wall ++ inner ++ center ++ inner ++ wall
    where
        pad = 5
        titleL = length title
        wall = ['*' | x <- [1..(pad*2+2)]] ++ ['*' | x <- [1..titleL]] ++ "\n"
        inner = "*" ++ [' ' | x <- [1..pad]] ++ [' ' | x <- [1..titleL]] ++ [' ' | x <- [1..pad]] ++ "*" ++ "\n"
        center = "*" ++ [' ' | x <- [1..pad]] ++ map toUpper title ++ [' ' | x <- [1..pad]] ++ "*" ++ "\n"
