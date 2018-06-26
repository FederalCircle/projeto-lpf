module CLI.Pages (
    clear,
    page1,
    page2,
    page3,
    register,
    login
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

inputField :: IO ()
inputField = do
    value <- getLine
    putStrLn value
    return ()

header :: IO ()
header = do
    clear
    putStrLn "_______________"
    putStrLn "0 - Previus"
    putStrLn "---------------"
    putStrLn " "
    return ()

register :: IO ()
register = do
    header
    putStrLn "Type your complete name:"
    inputField
    putStrLn "Type your e-mail:"
    inputField
    putStrLn "Type your birthday:"
    inputField
    putStrLn "Type your cpf:"
    inputField
    header
    putStrLn "Successful registration!"
    return ()

login :: IO ()
login = do 
    header
    putStrLn "Type your cpf:"
    inputField
    putStrLn "Type your password:"
    inputField
    putStrLn "Successful login!"
    return ()


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
