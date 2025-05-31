
module Audio where

import Control.Monad (void)
import Data.Maybe (fromMaybe)
import Language.Javascript.JSaddle
import Miso hiding ((<#))
import Miso.String (MisoString)

-------------------------------------------------------------------------------
-- tested
-------------------------------------------------------------------------------

duration :: Audio -> JSM Double
duration (Audio a) = do
  value <- a ! "duration"
  fromMaybe 0 <$> fromJSVal value

setVolume :: Audio -> Double -> JSM ()
setVolume (Audio a) = a <# "volume"

getVolume :: Audio -> JSM Double
getVolume (Audio a) = do
  value <- a ! "volume"
  fromMaybe 0 <$> fromJSVal value

load :: Audio -> JSM ()
load (Audio a) = void $ a # "load" $ ()

ended :: Audio -> JSM Bool
ended (Audio a) = do
  value <- a ! "ended"
  fromMaybe False <$> fromJSVal value

-------------------------------------------------------------------------------
-- not tested
-------------------------------------------------------------------------------

