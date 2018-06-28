{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_projeto_lpf (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Alyson\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\Alyson\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.4.3\\projeto-lpf-0.1.0.0-K52TUZmEb6p8KzrcQiM3rQ-projeto-lpf-exe"
dynlibdir  = "C:\\Users\\Alyson\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.4.3"
datadir    = "C:\\Users\\Alyson\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.4.3\\projeto-lpf-0.1.0.0"
libexecdir = "C:\\Users\\Alyson\\AppData\\Roaming\\cabal\\projeto-lpf-0.1.0.0-K52TUZmEb6p8KzrcQiM3rQ-projeto-lpf-exe\\x86_64-windows-ghc-8.4.3\\projeto-lpf-0.1.0.0"
sysconfdir = "C:\\Users\\Alyson\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "projeto_lpf_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "projeto_lpf_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "projeto_lpf_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "projeto_lpf_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "projeto_lpf_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "projeto_lpf_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
