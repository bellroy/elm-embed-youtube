# elm-embed-youtube

A wrapper around the [Youtube IFrame Api](https://developers.google.com/youtube/iframe_api_reference)

The IFrame player API lets you embed a YouTube video player on your website.

## Goal

A simple way of embedding a Youtube player using an Iframe in Elm.


## Usage example

```elm
Embed.Youtube.fromString "kBZsyksIgNE"
    |> Embed.Youtube.attributes
        [ Embed.Youtube.Attributes.width 640
        , Embed.Youtube.Attributes.height 400
        ]
    |> Embed.Youtube.toHtml


```

```elm
Embed.Youtube.fromString "kBZsyksIgNE"
    |> Embed.Youtube.attributes
        [ Embed.Youtube.Attributes.width 640
        , Embed.Youtube.Attributes.height 400
        , Embed.Youtube.Attributes.autoplay
        , Embed.Youtube.Attributes.language "nl"
        , Embed.Youtube.Attributes.modestBranding
        , Embed.Youtube.Attributes.disableFullscreen
        , Embed.Youtube.Attributes.disableKeyboard
        ]
    |> Embed.Youtube.toHtml

```
