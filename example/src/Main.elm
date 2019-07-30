module Example exposing (main)

import Browser exposing (element)
import Embed.Youtube exposing (..)
import Embed.Youtube.Attributes exposing (..)
import Html


type Model
    = Model


type Msg
    = NoOp


main : Program () Model Msg
main =
    element
        { init = init
        , update = update
        , subscriptions = always Sub.none
        , view = view
        }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html.Html Msg
view _ =
    Html.div []
        [ fromString "kBZsyksIgNE"
            |> attributes
                [ width 530
                , height 300
                , start 54
                , autoplay
                , loop
                , language "nl"
                , modestBranding
                , disableFullscreen
                , disableKeyboard
                ]
            |> toHtml
        ]
