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
    homePage
    return ()
