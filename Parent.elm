import Html exposing (div, button, text)
import Html.Events exposing (onClick)
import Signal
import ChildOne
import ChildTwo


-- View

view address model =
  div []
    [ ChildOne.view (Signal.forwardTo address ChildOneAction) model.childOneModel
    , ChildTwo.view model.childTwoModel
    ]


-- Update

type Action = NoAction | ChildOneAction ChildOne.Action

update action model =
  case action of
    NoAction -> model
    ChildOneAction act ->
      let (newChildOneModel, maybeRequest) = ChildOne.update act model.childOneModel in
        case maybeRequest of
          Nothing -> {model | childOneModel = newChildOneModel}
          Just request ->
            case request of
              ChildOne.UpdateCounter newValue -> {model | childOneModel = newChildOneModel, childTwoModel = newValue}


-- Signals

main =
  Signal.map (view actions.address) model

model =
  Signal.foldp update {childOneModel = ChildOne.model, childTwoModel = ChildTwo.model} actions.signal

actions : Signal.Mailbox Action
actions =
  Signal.mailbox NoAction