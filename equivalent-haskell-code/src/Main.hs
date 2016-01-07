import System.Directory
import Data.Maybe
main= do
   dirtree<-allsubdirs "."
   putStrLn $ show dirtree


subdirs::String->IO [FilePath]
subdirs s= do
  all<- getDirectoryContents s
  dirmay <- sequence $ map dirToMaybe all
  return $ filter (/="..") $filter (/=".") $map fromJust $filter isJust dirmay
  where
    dirToMaybe ss = do
      b<-doesDirectoryExist ss
      return $ if b then Just ss else Nothing

allsubdirs::String -> IO [String]
allsubdirs r = do
     ds<-subdirs r
     sds<- sequence $ map allsubdirs ds
     return $ ds ++ concat sds




