module Embed.Youtube.Thumbnail exposing
    ( toUrl
    , ThumbnailVariant(..)
    )

{-|

@docs toUrl

@docs ThumbnailVariant

-}

import Embed.Youtube.Internal.Youtube exposing (Youtube(..), YoutubeVideoId(..))
import Url exposing (..)


{-|

  - Player Background Thumbnail (480x360):

    `PlayerBackground`

    ![PlayerBackground](https://img.youtube.com/vi/9bZkp7q19f0/0.jpg)

  - Video frames thumbnails (120x90)

    `First | Second | Third`

    ![First](https://img.youtube.com/vi/9bZkp7q19f0/1.jpg)
    ![Second](https://img.youtube.com/vi/9bZkp7q19f0/2.jpg)
    ![Third](https://img.youtube.com/vi/9bZkp7q19f0/3.jpg)

  - Lowest quality thumbnail (120x90)

    `LowQuality`

    ![LowQuality](https://img.youtube.com/vi/9bZkp7q19f0/sddefault.jpg)

  - Medium quality thumbnail (320x180)

    `MediumQuality`

    ![MediumQuality](https://img.youtube.com/vi/9bZkp7q19f0/mqdefault.jpg)

  - High quality thumbnail (480x360)

    `HighQuality`

    ![HighQuality](https://img.youtube.com/vi/9bZkp7q19f0/hqdefault.jpg)

  - Standard quality thumbnail (640x480)

    `StandardQuality`

    ![StandardQuality](https://img.youtube.com/vi/9bZkp7q19f0/default.jpg)

  - Unscaled thumbnail resolution

    `MaximumQuality`

    ![MaximumQuality](https://img.youtube.com/vi/9bZkp7q19f0/maxresdefault.jpg)

-}
type ThumbnailVariant
    = PlayerBackground
    | First
    | Second
    | Third
    | LowQuality
    | MediumQuality
    | HighQuality
    | StandardQuality
    | MaximumQuality


{-| Grab a thumbnail from your Youtube video
-}
toUrl : ThumbnailVariant -> Youtube -> Url
toUrl variant (Youtube (YoutubeVideoId stringYoutubeVideoid) _) =
    { protocol = Https
    , host = "img.youtube.com"
    , port_ = Nothing
    , path = "/vi/" ++ stringYoutubeVideoid ++ "/" ++ thumbnailVariantToImageName variant
    , query = Nothing
    , fragment = Nothing
    }


{-| ThumbnailVariant to image name

**Note that in same cases Youtube does not render all the available thumbnails.**

-}
thumbnailVariantToImageName : ThumbnailVariant -> String
thumbnailVariantToImageName thumbnailVariant =
    case thumbnailVariant of
        PlayerBackground ->
            "0.jpg"

        First ->
            "1.jpg"

        Second ->
            "2.jpg"

        Third ->
            "3.jpg"

        LowQuality ->
            "sddefault.jpg"

        MediumQuality ->
            "mqdefault.jpg"

        HighQuality ->
            "hqdefault.jpg"

        StandardQuality ->
            "default.jpg"

        MaximumQuality ->
            "maxresdefault.jpg"
