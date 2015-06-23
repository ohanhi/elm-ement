module Hello where

import Graphics.Element exposing (..)
import Signal exposing ((<~), foldp)

port increment : Signal ()

total : Signal Int
total = foldp (+) 0 (always 1 <~ increment)

view : Int -> Element
view n =
  show ("Hello Web Components! Click count: " ++ toString n)

main : Signal Element
main = view <~ total
