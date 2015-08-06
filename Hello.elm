module Hello where

import Graphics.Element exposing (..)
import Signal exposing ((<~), (~), foldp)

port increment : Signal ()
port greeting : Signal String

total : Signal Int
total = foldp (+) 0 (always 1 <~ increment)

view : Int -> String -> Element
view n greeting =
  show (greeting ++ " Web Components! Click count: " ++ toString n)

main : Signal Element
main = view <~ total ~ greeting
