module Cliente (
    Cliente,
    CardVirtual,
    createCard
) where

-- Eq é usado para fazer comparações (==)(/=)
-- Show é usado para converter em String e mostrar na tela
-- Read é responsavel para converter em String e lê na tela

-- Estrutura de data para guardar as informacões de um cliente
data Cliente = Cliente {
    name :: String,
    cpf :: Int,
    keyid :: Int,
    email :: String,
    cardvirtual :: CardVirtual
} deriving (Eq, Show)

--Estrutura de data para representar o cartão virtual do cliente
data CardVirtual = CardVirtual {
    numbCard :: Int,
    nameCard :: String
} deriving (Eq, Show)

-- type register = Int 0
-- register = (gera um numero aleatorio)
createCard :: Cliente -> CardVirtual
createCard (Cliente name cpf _ _ _ ) = CardVirtual cpf name
