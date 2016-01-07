module Paths_equivalent_haskell_code (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/joco/coding/jhegedus42-github/idris-py-examples/equivalent-haskell-code/.cabal-sandbox/bin"
libdir     = "/home/joco/coding/jhegedus42-github/idris-py-examples/equivalent-haskell-code/.cabal-sandbox/lib/x86_64-linux-ghc-7.10.2/equivalent-haskell-code-0.1.0.0-CnxALwMQut3HkGZAgZNNHu"
datadir    = "/home/joco/coding/jhegedus42-github/idris-py-examples/equivalent-haskell-code/.cabal-sandbox/share/x86_64-linux-ghc-7.10.2/equivalent-haskell-code-0.1.0.0"
libexecdir = "/home/joco/coding/jhegedus42-github/idris-py-examples/equivalent-haskell-code/.cabal-sandbox/libexec"
sysconfdir = "/home/joco/coding/jhegedus42-github/idris-py-examples/equivalent-haskell-code/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "equivalent_haskell_code_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "equivalent_haskell_code_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "equivalent_haskell_code_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "equivalent_haskell_code_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "equivalent_haskell_code_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
