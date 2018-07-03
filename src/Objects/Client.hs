module Objects.Client where

data Client = Client {
    name :: String,
    cpf :: String,
    password :: String
} deriving (Show)

instance Eq Client where
    (==) (Client{cpf=cpf1}) (Client{cpf=cpf2}) = cpf1 == cpf2
