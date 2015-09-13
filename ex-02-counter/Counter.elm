module Counter (init, update, view) where

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)


-- MODEL

type alias Model = Int


init : Int -> Model
init count = count


-- UPDATE

type Action
    = Reset
    | Inc
    | Dec


update : Action -> Model -> Model
update action model =
  case action of
    Reset -> init 0

    Inc -> model + 1

    Dec -> model - 1


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  div []
    [
      div []
        [ button [onClick address Inc] [ text "+" ]
        , text (toString model)
        , button [onClick address Dec] [ text "-" ]
        ]
        , button [onClick address Reset] [ text "Reset" ]
    ]


