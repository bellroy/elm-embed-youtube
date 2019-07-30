module Embed.Youtube.Internal.Youtube exposing (Youtube(..), YoutubeVideoId(..), attributes, fromString, fromUrl)

import Embed.Youtube.Internal.Attribute exposing (Attribute(..))
import Url exposing (Url)
import Url.Parser exposing ((<?>), Parser, map, parse, s)
import Url.Parser.Query exposing (string)


type Youtube
    = Youtube YoutubeVideoId (List Attribute)


type YoutubeVideoId
    = YoutubeVideoId String


{-| Attempt to create a new Youtube from an (Youtube) Url containing the v= param.

    https://www.youtube.com/watch?v=xLLkZa662Fs

-}
fromUrl :
    Url
    -> Maybe Youtube
fromUrl url =
    case parse parseVideoId url of
        Just (Just youtubeVideoId) ->
            Just <| Youtube youtubeVideoId []

        _ ->
            Nothing


{-| Create a new Youtube from a string representing a VideoId

**There is no validation on the input**

-}
fromString :
    String
    -> Youtube
fromString stringYoutubeVideoid =
    Youtube (YoutubeVideoId stringYoutubeVideoid) []


attributes :
    List Attribute
    -> Youtube
    -> Youtube
attributes a (Youtube youtubeVideoid listOfAttributes) =
    Youtube youtubeVideoid (listOfAttributes ++ a)



-- Parser


parseVideoId :
    Parser
        (Maybe YoutubeVideoId
         -> Maybe YoutubeVideoId
        )
        (Maybe YoutubeVideoId)
parseVideoId =
    map (Maybe.map YoutubeVideoId)
        (s "watch" <?> string "v")
