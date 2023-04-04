module Embed.Youtube.Internal.Attribute exposing (Attribute(..))

{-| The type of a Youtube Attribute
-}


type Attribute
    = Width Int
    | Height Int
    | LazyLoad
    | Autoplay
    | Loop
    | Start Int
    | End Int
    | Mute
    | ColorRed
    | ColorWhite
    | ModestBranding
    | PlaysInline
    | HideControls
    | DisableKeyboard
    | DisableFullscreen
    | VideoAnnotations
    | Language String
    | ClosedCaptionsLanguagePreference String
    | ClosedCaptionsLanguageAlwaysShow
