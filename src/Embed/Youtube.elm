module Embed.Youtube exposing
    ( Youtube, Attribute
    , fromUrl, fromString
    , attributes
    , toHtml
    )

{-| Create an embedded Youtube video using the [Iframe Player Api](https://developers.google.com/youtube/iframe_api_reference)


# Youtube

@docs Youtube, Attribute


# Creation

@docs fromUrl, fromString


# Attributes

Check Embed.Youtube.Attributes for all the available Attribute helpers

@docs attributes


# Html

@docs toHtml

-}

import Embed.Youtube.Internal.Attribute as Internal
import Embed.Youtube.Internal.View as Internal
import Embed.Youtube.Internal.Youtube as Internal
import Html exposing (Html)
import Url exposing (Url)


{-| The type of an Youtube image
-}
type alias Youtube =
    Internal.Youtube


{-| The type of a Youtube Attribute
-}
type alias Attribute =
    Internal.Attribute


{-| Attempt to create a new Youtube

from an (Youtube) Url containing the v= param.
<https://www.youtube.com/watch?v=0D7GrGrN1bg>

    import Url

    Url.fromString "https://www.youtube.com/watch?v=0D7GrGrN1bg"
    |> Maybe.andThen fromUrl
    --> Just <| fromString "0D7GrGrN1bg"

or from shortend links such as;
<https://youtu.be/0D7GrGrN1bg>

    import Url

    Url.fromString "https://youtu.be/0D7GrGrN1bg"
    |> Maybe.andThen fromUrl
    --> Just <| fromString "0D7GrGrN1bg"

-}
fromUrl : Url -> Maybe Youtube
fromUrl =
    Internal.fromUrl


{-| Create a new Youtube from a string representing a VideoId

**There is no validation on the input**

-}
fromString : String -> Youtube
fromString =
    Internal.fromString


{-| Add Attributes to your Youtube type
-}
attributes : List Attribute -> Youtube -> Youtube
attributes =
    Internal.attributes


{-| Renders an iFrame based on your settings
-}
toHtml : Youtube -> Html msg
toHtml =
    Internal.toIframe
