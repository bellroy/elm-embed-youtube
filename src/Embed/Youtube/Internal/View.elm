module Embed.Youtube.Internal.View exposing (toIframe, toYoutubeUrl)

import Embed.Youtube.Internal.Attribute as YoutubeAttribute exposing (Attribute(..))
import Embed.Youtube.Internal.Youtube exposing (Youtube(..), YoutubeVideoId(..))
import Html exposing (Html)
import Html.Attributes as HtmlA
import Url exposing (Protocol(..), Url)
import Url.Builder as UrlBuilder exposing (QueryParameter)


{-| Render Youtube as an embedded iFrame
-}
toIframe :
    Youtube
    -> Html msg
toIframe yt =
    Html.iframe
        ([ toYoutubeUrl yt
            |> Url.toString
            |> HtmlA.src
         , HtmlA.type_ "text/html"
         , HtmlA.attribute "allowfullscreen" "true"
         , HtmlA.attribute "allow" "accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture; fullscreen"
         , HtmlA.attribute "frameborder" "0"
         ]
            ++ toHtmlAttributes yt
        )
        []


{-| Youtube to youtube iFrame embed Url
-}
toYoutubeUrl : Youtube -> Url
toYoutubeUrl ((Youtube (YoutubeVideoId stringYoutubeVideoid) _) as yt) =
    { protocol = Https
    , host = "www.youtube-nocookie.com"
    , port_ = Nothing
    , path = "/embed/" ++ stringYoutubeVideoid
    , query =
        toQueryParameters yt
            |> UrlBuilder.toQuery
            |> String.dropLeft 1
            |> Just
    , fragment = Nothing
    }


{-| Takes a list of attributes and creates a list of QueryParameters that the Youtube embed Api understands.
-}
toQueryParameters :
    Youtube
    -> List QueryParameter
toQueryParameters (Youtube youtubeVideoId attributes) =
    List.foldl (\a -> (++) (toQueryParameters_ youtubeVideoId a)) [] attributes
        ++ [ UrlBuilder.string "version" "3"
           , UrlBuilder.string "rel" "0"
           , UrlBuilder.string "enablejsapi" "1"
           ]


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
            Just <| HtmlA.width a

        Height a ->
            Just <| HtmlA.height a

        LazyLoad ->
            Just <| HtmlA.attribute "loading" "lazy"

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

        LazyLoad ->
            []

        Autoplay ->
            [ UrlBuilder.string "autoplay" "1"
            , UrlBuilder.string "mute" "1"
            ]

        Loop ->
            [ UrlBuilder.string "loop" "1"
            , UrlBuilder.string "playlist" stringYoutubeVideoId
            ]

        Start a ->
            [ UrlBuilder.int "start" a ]

        End a ->
            [ UrlBuilder.int "end" a ]

        Mute ->
            [ UrlBuilder.string "mute" "1" ]

        ColorRed ->
            [ UrlBuilder.string "color" "red" ]

        ColorWhite ->
            [ UrlBuilder.string "color" "white" ]

        ModestBranding ->
            [ UrlBuilder.string "modestbranding" "1"
            , UrlBuilder.string "showinfo" "1"
            ]

        PlaysInline ->
            [ UrlBuilder.string "playsinline" "1"
            , UrlBuilder.string "webkit-playsinline" "1"
            ]

        HideControls ->
            [ UrlBuilder.string "controls" "0" ]

        DisableKeyboard ->
            [ UrlBuilder.string "disablekb" "1" ]

        DisableFullscreen ->
            [ UrlBuilder.string "fs" "0" ]

        VideoAnnotations ->
            [ UrlBuilder.string "iv_load_policy" "3" ]

        Language a ->
            [ UrlBuilder.string "hl" a ]

        ClosedCaptionsLanguagePreference a ->
            [ UrlBuilder.string "cc_lang_pref" a ]

        ClosedCaptionsLanguageAlwaysShow ->
            [ UrlBuilder.string "cc_load_policy" "1" ]
