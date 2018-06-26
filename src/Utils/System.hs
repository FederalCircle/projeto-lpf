module Utils.System (
    clear
) where

import System.Process

clear = system "cls"
