module Bank where
    import Cliente
    import Cadastro

main :: IO ()
main = do
    {catch (ler_arq) tratar_error;} --trata o erro do arquivo
    where
        ler_arq = do
            {
                arq_leitura <- openFile "dadoscliente.txt" ReadMode;
                dados_leitura <- hGetLine arq_leitura;
                menu (read dados_leitura);
                return ()
            }
        tratar_error = if isDoesNotExistError erro then do
            {
                novo_arq <- openFile "dadoscliente.txt" WriteMode;
                hputStrLn novo_arq "[]";
                hClose novo_arq;
                menu []
                return ()
            }
        else
            ioError erro

menu :: Bank -> IO Bank
menu bank = do
    system "cls" -- limpa a tela do cmd do windows
    putStrLn "-------------------------------- LPF BANK --------------------------------\n"
    putStrLn "Digite 1 para Logar\n"
    putStrLn "Digite 2 para cadastrar\n"
    putStrLn "Digite 0 para sair\n"
    putStr "Opção: "
    opcao <- getChar
    getChar -- descarta o Enter
    executarOpcao bank opcao

    executarOpcao
