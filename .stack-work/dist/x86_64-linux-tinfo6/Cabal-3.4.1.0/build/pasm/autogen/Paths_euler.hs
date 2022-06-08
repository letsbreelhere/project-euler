{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_euler (
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

bindir     = "/home/bree/dev/euler/.stack-work/install/x86_64-linux-tinfo6/79679a6894ed4f02b9877e039d1dff74b25f9b2d5d438f5854c06a09541b596e/9.0.2/bin"
libdir     = "/home/bree/dev/euler/.stack-work/install/x86_64-linux-tinfo6/79679a6894ed4f02b9877e039d1dff74b25f9b2d5d438f5854c06a09541b596e/9.0.2/lib/x86_64-linux-ghc-9.0.2/euler-0.1.0.0-4xuCEeKcQ4eKt6qZU2WpDW-pasm"
dynlibdir  = "/home/bree/dev/euler/.stack-work/install/x86_64-linux-tinfo6/79679a6894ed4f02b9877e039d1dff74b25f9b2d5d438f5854c06a09541b596e/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/bree/dev/euler/.stack-work/install/x86_64-linux-tinfo6/79679a6894ed4f02b9877e039d1dff74b25f9b2d5d438f5854c06a09541b596e/9.0.2/share/x86_64-linux-ghc-9.0.2/euler-0.1.0.0"
libexecdir = "/home/bree/dev/euler/.stack-work/install/x86_64-linux-tinfo6/79679a6894ed4f02b9877e039d1dff74b25f9b2d5d438f5854c06a09541b596e/9.0.2/libexec/x86_64-linux-ghc-9.0.2/euler-0.1.0.0"
sysconfdir = "/home/bree/dev/euler/.stack-work/install/x86_64-linux-tinfo6/79679a6894ed4f02b9877e039d1dff74b25f9b2d5d438f5854c06a09541b596e/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "euler_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "euler_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "euler_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "euler_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "euler_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "euler_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
