module Main (
    main
) where

import Utils.System
import CLI.Pages
import CLI.Layout

main :: IO ()
main = do clear; homePage
