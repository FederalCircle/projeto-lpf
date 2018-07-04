module CLI.Pages (
    homePage,
    loginPage,
    signupPage
) where

import CLI.Inputs
import CLI.Layout
import Utils.System
import Objects.Client

homePage :: IO ()
homePage = do
    headerLayout "Home"
    optionsLayout ["Login", "Signup"]
    selectOption [loginPage, signupPage]
    return ()

loginPage :: IO ()
loginPage = do
    headerLayout "Login"
    putStrLn "Type your cpf:"
    cpf <- getLine
    putStrLn "Type your password:"
    password <- getLine
    clear
    putStrLn "Successful login!\n"
    homePage
    return ()

signupPage :: IO ()
signupPage = do
    headerLayout "Signup"
    putStrLn "Type your complete name:"
    name <- getLine
    putStrLn "Type your cpf:"
    cpf <- getLine
    putStrLn "Type your password:"
    password <- getLine
    clear
    putStrLn $ "New user: " ++ show (Client name cpf password)
    putStrLn "Successful registration!\n"
    dashPage (Client name cpf password)
    return ()

dashPage :: Client -> IO ()
dashPage (Client name cpf password) = do
    headerLayout "Dashboard"
    putStrLn $ "Welcome " ++ name ++ "!"
    putStrLn $ "Your bank balance is: R$ 0,00"
    optionsLayout ["Transfer", "Exit"]
    selectOption [transferPage, homePage]
    return ()

transferPage :: IO ()
transferPage = do
    headerLayout "Bank Transfer"
    putStrLn $ "Type 'cancel' to exit the operation!"
    putStrLn $ "Your bank balance is: R$ 0,00"
    putStrLn "Transfer amount: R$ "
    amount <- getLine
    readInput amount
    putStrLn "Destination account (cpf): "
    destination <- getLine
    readInput destination
    putStrLn "Do you want to confirm the operation? (yes/no)"
    confirm <- getLine
    readInput confirm
    return ()


readInput :: String -> IO ()
readInput str
    | str == "cancel" = exitOp
    | str == "no" = exitOp
    | otherwise = return ()
    where 
        exitOp = do
            clear
            dashPage