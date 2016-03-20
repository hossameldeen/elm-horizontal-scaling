module ChildOne(..) where

import Html exposing (div, button, text)
import Html.Events exposing (onClick)

model = 0

view address model =
  div []
    [ text "ChildOne "
    , button [ onClick address Decrement ] [ text "-" ]
    , button [ onClick address Increment ] [ text "+" ]
    ]


type Action = Increment | Decrement

type Request = UpdateCounter Int

update action model =
  case action of
    Increment -> (model + 1, Just (UpdateCounter (model + 1)))
    Decrement -> (model - 1, Just (UpdateCounter (model - 1)))