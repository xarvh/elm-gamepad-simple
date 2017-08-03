module Gamepad.Simple exposing (..)

import Gamepad exposing (Gamepad)
import Gamepad.Remap
import Html exposing (Html)


{-| -}
type alias Ports =
    { gamepad : (( Time, Gamepad.Simple.Blob ) -> msg) -> Sub msg
    , localStorageSet : ( String, String ) -> Cmd msg
    }


type Model appModel
    = Model
        { app : appModel
        , gamepadDatabase : Gamepad.Database
        , maybeRemap : Maybe Gamepad.Remap.Model
        }



{-
   type Msg
       = OnGamepad Time (List Gamepad)


   type alias Model =
       ...


   init : Flags -> Model
   init flags =
       ...


   update : Msg -> Model -> ( Model, Cmd Msg )
   update msg model =
       case msg of
           OnGamepad etaSinceLastWindowFrame gamepads ->
               let
                   playersFire =
                       List.map Gamepad.Simple.leftTriggerIsPressed gamepads
               in
                   ...


   view : Model -> Html Msg
   view model =
       ...


   main =
       Gamepad.Simple.program
           { init = init
           , update = update
           , view = view
           , subscriptions = subscriptions
           , onGamepad = OnGamepad
           , gamepadPorts = GamepadPorts.ports
           }
-}


program :
    { init : ( model, Cmd msg )
    , update : msg -> model -> ( model, Cmd msg )
    , subscriptions : model -> Sub msg
    , view : model -> Html msg
    , onGamepad : ( Time, List Gamepad ) -> msg
    }
    -> Program Never model msg
