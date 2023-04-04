module Embed.Youtube.Attributes exposing
    ( width, height
    , lazyLoad
    , autoplay, loop, start, end, mute
    , colorRed, colorWhite, modestBranding, playsInline, hideControls, disableKeyboard, disableFullscreen, disableVideoAnnotations
    , language
    , closedCaptionsLanguagePreference, closedCaptionsLanguageAlwaysShow
    )

{-| Helper functions for Youtube Embed Attributes.


# Sizing

@docs width, height


# iframe HTML Attributes

@docs lazyLoad


# Playback

@docs autoplay, loop, start, end, mute


# Styling

@docs colorRed, colorWhite, modestBranding, playsInline, hideControls, disableKeyboard, disableFullscreen, disableVideoAnnotations


# Language

@docs language


# Closed Captions

@docs closedCaptionsLanguagePreference, closedCaptionsLanguageAlwaysShow

-}

import Embed.Youtube.Internal.Attribute exposing (Attribute(..))



-- Sizing


{-| Set the width of the Embedded Youtube player
-}
width : Int -> Attribute
width =
    Width


{-| Set the height of the Embedded Youtube player
-}
height : Int -> Attribute
height =
    Height



-- iframe HTML Attributes


{-| Set the loading attribute of the iframe to `lazy`
-}
lazyLoad : Attribute
lazyLoad =
    LazyLoad



-- Playback


{-| Specify whether the initial video will automatically start to play when the player loads
-}
autoplay : Attribute
autoplay =
    Autoplay


{-| This setting causes the player to play the initial video again and again.
-}
loop : Attribute
loop =
    Loop


{-| This causes the player to begin playing the video at the given number of seconds from the start of the video.
-}
start : Int -> Attribute
start =
    Start


{-| This parameter specifies the time, measured in seconds from the start of the video, when the player should stop playing the video. The parameter value is a positive integer.

Note that the time is measured from the beginning of the video and not from the value of the `start` parameter.

-}
end : Int -> Attribute
end =
    End


{-| Mute all sound
-}
mute : Attribute
mute =
    Mute



-- Styling


{-| This specifies the color that will be used in the player's video progress bar to highlight the amount of the video that the viewer has already seen.

The player uses the color red in the video progress bar.

-}
colorRed : Attribute
colorRed =
    ColorRed


{-| This specifies the color that will be used in the player's video progress bar to highlight the amount of the video that the viewer has already seen.

The player uses the color white in the video progress bar.

-}
colorWhite : Attribute
colorWhite =
    ColorRed


{-| This lets you use a YouTube player that does not show a YouTube logo.

Note that a small YouTube text label will still display in the upper-right corner of a paused video when the user's mouse pointer hovers over the player.

-}
modestBranding : Attribute
modestBranding =
    ModestBranding


{-| This controls whether videos play inline or fullscreen in an HTML5 player on iOS.
-}
playsInline : Attribute
playsInline =
    PlaysInline


{-| Indicates whether the video player controls are displayed.
-}
hideControls : Attribute
hideControls =
    HideControls


{-| Setting this causes the player to not respond to keyboard controls.
-}
disableKeyboard : Attribute
disableKeyboard =
    DisableKeyboard


{-| Prevents the fullscreen button from displaying in the player.
-}
disableFullscreen : Attribute
disableFullscreen =
    DisableFullscreen


{-| Prevents video annotations from being shown.
-}
disableVideoAnnotations : Attribute
disableVideoAnnotations =
    VideoAnnotations



-- Language


{-| Sets the player's interface language

Set the parameter's value to an [ISO 639-1 two-letter language code](https://www.loc.gov/standards/iso639-2/php/code_list.php).

-}
language : String -> Attribute
language =
    Language



-- Closed Captions


{-| Specify the default language that the player will use to display captions.

Set the parameter's value to an [ISO 639-1 two-letter language code](https://www.loc.gov/standards/iso639-2/php/code_list.php).

-}
closedCaptionsLanguagePreference : String -> Attribute
closedCaptionsLanguagePreference =
    ClosedCaptionsLanguagePreference


{-| Show closed captions by default, even if the user has turned captions off.

The default behavior is based on user preference.

-}
closedCaptionsLanguageAlwaysShow : Attribute
closedCaptionsLanguageAlwaysShow =
    ClosedCaptionsLanguageAlwaysShow
