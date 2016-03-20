module ChildTwo(..) where

import Html exposing (div, button, text)
import Html.Events exposing (onClick)

model = 0

view model =
  div [] [ text ("ChildTwo " ++ toString model) ]
