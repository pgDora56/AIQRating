{-# LANGUAGE OverloadedStrings #-}
module Processer where 

import qualified Data.Text as DT
import qualified Data.Text.IO as DTI

import Control.Exception (catch)
import Database.SQLite.Simple ( FromRow(..)
                              , Only(..)
                              , ToRow(..)
                              , close
                              , execute
                              , execute_
                              , open
                              , query
                              , SQLError(..)
                              )
import Database.SQLite.Simple.FromRow (field)

data Record = Record Int DT.Text Int Int Int Double deriving Show

data Activity = Activity Int Int String deriving Show
data ARecord = ARecord Int Int Int Int Int Int Double Double deriving Show
data Rate = Rate Int String Double (Maybe String) deriving Show

instance FromRow Rate where
    fromRow = Rate <$> field <*> field <*> field <*> field


parser :: [[DT.Text]] -> [IO Record]
parser [] = []
parser (x:xs) = case px of 
    Just r -> r:parser xs
    Nothing -> parser xs
    where px = parser' x

parser' :: [DT.Text] -> Maybe (IO Record)
parser' [r, n, s, c, w] = (Just (Record (dt2Int r) n (dt2Int $ DT.dropEnd 1 s) (dt2Int $ DT.drop 1 c) (dt2Int $ DT.drop 1 w) <$> (getBeforeRate <$> getRate n)))
parser' _ = Nothing

dt2Int :: DT.Text -> Int
dt2Int x = (read $ DT.unpack x) :: Int

getNo :: DT.Text -> IO Int
getNo name = getNo' <$> getRate name

getNo' :: Rate -> Int
getNo' (Rate no _ _ _) = no

getBeforeRate :: Rate -> Double
getBeforeRate (Rate _ _ rate _) = rate

getRate :: DT.Text -> IO Rate
getRate name = do
    conn <- open "aiq-rate.sqlite3"
    rs <- query conn "select * from rate where NAME = ?" (Only name) :: IO [Rate]
    return $ head rs

