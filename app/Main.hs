module Main (
    main
) where

import Utils.System
import CLI.Pages

main :: IO ()
main = do
    clear
    homePage
    return ()
