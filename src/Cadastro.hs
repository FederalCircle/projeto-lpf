module Cadastro where
    import System.IO
    import System.IO.Error
    import System.Random (randomRIO)
    import Cliente

type Bank = [Cliente]
-- função que recebe uma String e retorna uma IO String
getString :: String -> IO String
getString str = do
    putStr str
    res <- getLine
    return res

--Gera o ID do cliente
-- gerakey :: Bank -> IO Int
-- gerakey listclient = do
--                     while

--função resposavel pelo cadastro do cliente
cadastroCliente :: Bank -> IO Bank
cadastroCliente bank = do
    nome <- getString "\nDigite seu nome"
    cpf <- getString "\nDigite o número do seu cpf"
    email <- getString "\nDigite o seu e-mail"
    confEmail <- getString "\nConfirme seu e-email"
    if (email == confEmail) then do
        if not (existecpf cpf) then do
            arqbank <- openFile "dadosbank.txt" WriteMode
            gerakey <- openFile "dadosbank.txt" ReadMode
            hPutStrLn arqbank ( show ( (Cliente nome cpf(createCard Cliente) ) : bank) )
