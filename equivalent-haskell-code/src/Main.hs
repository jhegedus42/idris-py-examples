import System.Directory
import Data.Maybe
main= do
   dirtree<-allsubdirs "."
   putStrLn $ show dirtree


subdirs::String->IO [FilePath]
subdirs s= do
  all<- getDirectoryContents s :: IO [FilePath]
  dirmay <- sequence $ map dirToMaybe all :: IO [ Maybe FilePath]
  return $  filter (/="..") $filter (/=".") $map fromJust $filter isJust dirmay
  where
    dirToMaybe ss = do
      b<-doesDirectoryExist (s++"/"++ss)
      return $ if b then Just ss else Nothing

allsubdirs::String -> IO [String]
allsubdirs r = do
     ds'<-subdirs r
     let ds=map ((r++"/")++) ds'
     sds<- sequence $ map allsubdirs ds
     return $ ds ++ concat sds




