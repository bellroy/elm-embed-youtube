module Embed.Youtube.Internal.ViewTest exposing (suite)

import Embed.Youtube.Internal.View as View
import Embed.Youtube.Internal.Youtube as InternalYoutube
import Expect as Expect
import Test as Test
import Url


suite : Test.Test
suite =
    Test.describe "toYoutubeUrl"
        [ Test.test "Url is correcly formatted" <|
            \_ ->
                Expect.equal
                    (View.toYoutubeUrl mockedYoutube
                        |> Url.toString
                    )
                    "https://www.youtube-nocookie.com/embed/ytvideoid?version=3&rel=0&enablejsapi=1"
        ]


mockedYoutube : InternalYoutube.Youtube
mockedYoutube =
    InternalYoutube.fromString "ytvideoid"
