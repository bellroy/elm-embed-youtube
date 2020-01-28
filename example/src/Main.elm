module Main exposing (main)

import Browser exposing (element)
import Embed.Youtube exposing (..)
import Embed.Youtube.Attributes exposing (..)
import Embed.Youtube.Thumbnail as Thumb exposing (..)
import Html
import Html.Attributes
import Url


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
    let
        youtube =
            fromString "kBZsyksIgNE"
    in
    Html.div []
        [ Html.h2 [] [ Html.text "Thumbnail" ]
        , Html.img
            [ Thumb.toUrl Thumb.HighQuality youtube
                |> Url.toString
                |> Html.Attributes.src
            ]
            []
        , Html.h2 [] [ Html.text "Embed" ]
        , toHtml <|
            attributes
                [ width 530
                , height 300
                , language "en"
                , playsInline
                ]
                youtube
        ]
