module Lexer where
import qualified Data.Text as DT
import qualified Data.Text.IO as DTI

lexer :: DT.Text -> [[DT.Text]]
lexer text = foldr splitListAdd [] $ splitLine text

splitLine :: DT.Text -> [DT.Text]
splitLine text = DT.split (=='\n') text

splitComma :: DT.Text -> [DT.Text]
splitComma text = DT.split (=='\t') text

splitListAdd :: DT.Text -> [[DT.Text]] -> [[DT.Text]]
splitListAdd text lis = (splitComma text):lis
