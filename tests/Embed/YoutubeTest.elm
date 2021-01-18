module Embed.YoutubeTest exposing (suite)

import Embed.Youtube as Yt
import Expect
import Test exposing (Test, describe, test)
import Url


suite : Test
suite =
    describe "Embed.Youtube"
        [ test_fromUrl
        ]


test_fromUrl : Test
test_fromUrl =
    describe "fromUrl"
        [ test "https://www.youtube.com/watch?v=0D7GrGrN1bg" <|
            \_ ->
                Url.fromString "https://www.youtube.com/watch?v=0D7GrGrN1bg"
                    |> Maybe.andThen Yt.fromUrl
                    |> Expect.equal (Just <| Yt.fromString "0D7GrGrN1bg")
        , test "https://youtu.be/0D7GrGrN1bg" <|
            \_ ->
                Url.fromString "https://youtu.be/0D7GrGrN1bg"
                    |> Maybe.andThen Yt.fromUrl
                    |> Expect.equal (Just <| Yt.fromString "0D7GrGrN1bg")
        ]
