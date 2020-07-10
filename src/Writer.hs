{-# LANGUAGE OverloadedStrings #-}
module Writer where 

import qualified Data.Text as DT
import qualified Data.Text.IO as DTI

write :: [[DT.Text]] -> IO()
write l = DTI.writeFile "output.txt" $ shape l ""
-- write l = print $ shape l ""

shape :: [[DT.Text]] -> DT.Text -> DT.Text
shape [] t = t
shape (l:ls) t = shape ls $ DT.concat [t, lineShape l, "\n"]

lineShape :: [DT.Text] -> DT.Text
lineShape = DT.intercalate "|"
