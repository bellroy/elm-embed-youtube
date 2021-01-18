module Embed.Youtube.Internal.Youtube exposing (Youtube(..), YoutubeVideoId(..), attributes, fromString, fromUrl)

import Embed.Youtube.Internal.Attribute exposing (Attribute(..))
import Url exposing (Url)
import Url.Parser exposing ((<?>), Parser, map, oneOf, parse, s, string)
import Url.Parser.Query as Query


type Youtube
    = Youtube YoutubeVideoId (List Attribute)


type YoutubeVideoId
    = YoutubeVideoId String


fromUrl :
    Url
    -> Maybe Youtube
fromUrl url =
    case parse parseVideoId url of
        Just (Just youtubeVideoId) ->
            Just <| Youtube youtubeVideoId []

        _ ->
            Nothing


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
    oneOf
        [ map (Maybe.map YoutubeVideoId)
            (s "watch" <?> Query.string "v")
        , map (Just << YoutubeVideoId) string
        ]
