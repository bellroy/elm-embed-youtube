module Embed.Youtube.Internal.View exposing (toIframe)

import Embed.Youtube.Internal.Attribute as YoutubeAttribute exposing (Attribute(..))
import Embed.Youtube.Internal.Youtube exposing (Youtube(..), YoutubeVideoId(..))
import Html as Html exposing (Attribute, Html, iframe)
import Html.Attributes as HtmlAttribute exposing (attribute, height, src, type_, width)
import Url exposing (Protocol(..), Url)
import Url.Builder exposing (QueryParameter, int, string, toQuery)


toIframe :
    Youtube
    -> Html msg
toIframe yt =
    Html.iframe
        ([ toYoutubeUrl yt
            |> Url.toString
            |> src
         , type_ "text/html"
         , attribute "allowfullscreen" "true"
         , attribute "allow" "fullscreen, autoplay"
         , attribute "frameborder" "0"
         ]
            ++ toHtmlAttributes yt
        )
        []


{-| Youtube to youtube iFrame embed Url
-}
toYoutubeUrl : Youtube -> Url
toYoutubeUrl ((Youtube (YoutubeVideoId stringYoutubeVideoid) _) as yt) =
    { protocol = Https
    , host = "www.youtube.com"
    , port_ = Nothing
    , path = "/embed/" ++ stringYoutubeVideoid
    , query = Just <| toQuery <| toQueryParameters yt
    , fragment = Nothing
    }


{-| Takes a list of attributes and creates a list of QueryParameters that the Youtube embed Api understands.
-}
toQueryParameters :
    Youtube
    -> List QueryParameter
toQueryParameters (Youtube youtubeVideoId attributes) =
    List.foldl (\a -> (++) (toQueryParameters_ youtubeVideoId a)) [] attributes
        ++ [ string "version" "3", string "rel" "0" ]


{-| Takes a list of attributes and creates a list of Html Attributes for the embedded element.
-}
toHtmlAttributes :
    Youtube
    -> List (Html.Attribute msg)
toHtmlAttributes (Youtube _ attributes) =
    List.filterMap toHtmlAttribute attributes


toHtmlAttribute :
    YoutubeAttribute.Attribute
    -> Maybe (Html.Attribute msg)
toHtmlAttribute attribute =
    case attribute of
        Width a ->
            Just <| width a

        Height a ->
            Just <| height a

        _ ->
            Nothing


toQueryParameters_ :
    YoutubeVideoId
    -> YoutubeAttribute.Attribute
    -> List QueryParameter
toQueryParameters_ (YoutubeVideoId stringYoutubeVideoId) attribute =
    case attribute of
        Width _ ->
            []

        Height _ ->
            []

        Autoplay ->
            [ string "autoplay" "1"
            , string "mute" "1"
            ]

        Loop ->
            [ string "loop" "1"
            , string "playlist" stringYoutubeVideoId
            ]

        Start a ->
            [ int "start" a ]

        End a ->
            [ int "end" a ]

        Mute ->
            [ string "mute" "1" ]

        ColorRed ->
            [ string "color" "red" ]

        ColorWhite ->
            [ string "color" "white" ]

        ModestBranding ->
            [ string "modestbranding" "1"
            , string "showinfo" "1"
            ]

        PlaysInline ->
            [ string "playsinline" "1" ]

        HideControls ->
            [ string "controls" "0" ]

        DisableKeyboard ->
            [ string "disablekb" "1" ]

        DisableFullscreen ->
            [ string "fs" "0" ]

        VideoAnnotations ->
            [ string "iv_load_policy" "3" ]

        Language a ->
            [ string "hl" a ]

        ClosedCaptionsLanguagePreference a ->
            [ string "cc_lang_pref" a ]

        ClosedCaptionsLanguageAlwaysShow ->
            [ string "cc_load_policy" "1" ]
