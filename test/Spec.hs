{-# LANGUAGE OverloadedStrings #-}
import Lexer
import Writer
import Processer
import System.IO
import qualified Data.Text.IO as DTI

main :: IO ()
main = do
    handle <- openFile "input.txt" ReadMode
    text <- DTI.hGetContents handle
    hClose handle
    let lexed = lexer text
    print lexed
    printer $ parser lexed
    -- rate <- getRate "Ｆｅａｒウルフ"
    -- print rate

printer :: [IO Record] -> IO()
printer [] = print "Nothing"
printer [r] = print =<< r
printer (r:rs) = do
    print =<< r
    printer rs
