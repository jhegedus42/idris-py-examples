module Main

import Python
import Python.Prim
import Python.Exceptions
import Python.Lib.Os

ListObj : Type->Type
ListObj a = Obj $ PyList a

M1 : Signature
M1 f=case f of
  "subdirs"=> [String] ~~> ListObj String
  _=>Module f

import_m1:PIO $ Obj M1
import_m1=importModule "m1"

subdirs:String ->PIO $ List String
subdirs s=do
  m1<- import_m1
  ds <- m1 /. "subdirs" $. [s]
  collect ds

data Tree = Node String (List Tree)

leaf: String->Tree
leaf s=Node s []

testTree: Tree
testTree= Node "1" [leaf "1.1",Node "1.2" [leaf "1.2.1",leaf "1.2.3"],leaf "1.3"]

instance Show Tree where
  show tr= showTree 0 tr
    where 
      indent : Nat->String
      indent i = concat $ replicate  i "  "
      showTree:Nat -> Tree->String
      showTree depth (Node s t) =indent depth++s++ "\n"++
        foldl Strings.(++) "" (map (showTree (depth+1)) t)

dirTree:String->PIO Tree
dirTree r= do
  ds'<-subdirs r
  let ds=map ((r++"/")++) ds'
  trees<-sequence $ map dirTree ds
  return $ Node r trees

allsubdirs:String->PIO $ List String
allsubdirs r = do
     ds'<-subdirs r
     let ds=map ((r++"/")++) ds'
     sds<- sequence $ map allsubdirs ds
     return $ ds ++ concat sds

main : PIO ()
main = do 
  putStrLn' "hw"
  dirs<-subdirs ".."
  putStrLn' $ show dirs 
  putStrLn' $ show testTree
  (map show (dirTree ".")) >>=putStrLn'
  (map show (allsubdirs ".")) >>=putStrLn'

