module CLI.Pages (
    homePage,
    page2,
    page3,
    register,
    login
) where

import CLI.Inputs
import CLI.Layout

register :: IO ()
register = do
    headerLayout "REGISTER"
    putStrLn "Type your complete name:"
    inputField
    putStrLn "Type your e-mail:"
    inputField
    putStrLn "Type your birthday:"
    inputField
    putStrLn "Type your cpf:"
    inputField
    putStrLn "Successful registration!"
    return ()

login :: IO ()
login = do
    headerLayout "LOGIN"
    putStrLn "Type your cpf:"
    inputField
    putStrLn "Type your password:"
    inputField
    putStrLn "Successful login!"
    return ()


homePage :: IO ()
homePage = do
    headerLayout "Home"
    optionsLayout ["Page 2", "Page 3"]
    selectOption [page2, page3]
    return ()

page2 :: IO ()
page2 = do
    headerLayout "PAGE 2"
    optionsLayout ["Home", "Page 3"]
    selectOption [homePage, page3]
    return ()

page3 :: IO ()
page3 = do
    headerLayout "PAGE 3"
    optionsLayout ["Home", "Page 2"]
    selectOption [homePage, page2]
    return ()
