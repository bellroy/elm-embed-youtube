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

import Embed.Youtube.Internal.Attribute
import Embed.Youtube.Internal.View
import Embed.Youtube.Internal.Youtube
import Html exposing (Html)
import Url exposing (Url)


{-| The type of an Youtube image
-}
type alias Youtube =
    Embed.Youtube.Internal.Youtube.Youtube


{-| The type of a Youtube Attribute
-}
type alias Attribute =
    Embed.Youtube.Internal.Attribute.Attribute


{-| Attempt to create a new Youtube from an (Youtube) Url containing the v= param.

    https://www.youtube.com/watch?v=xLLkZa662Fs

-}
fromUrl :
    Url
    -> Maybe Youtube
fromUrl =
    Embed.Youtube.Internal.Youtube.fromUrl


{-| Create a new Youtube from a string representing a VideoId

**There is no validation on the input**

-}
fromString :
    String
    -> Youtube
fromString =
    Embed.Youtube.Internal.Youtube.fromString


{-| Add Attributes to your Youtube type
-}
attributes :
    List Attribute
    -> Youtube
    -> Youtube
attributes a yt =
    Embed.Youtube.Internal.Youtube.attributes a yt


{-| Renders an iFrame based on your settings
-}
toHtml : Youtube -> Html msg
toHtml =
    Embed.Youtube.Internal.View.toIframe
