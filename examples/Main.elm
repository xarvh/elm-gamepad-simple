module Main exposing (..)

import Gamepad.Simple exposing (Gamepad)
import GamepadPort
import Html exposing (..)
import Html.Attributes
import Html.Events


-- types


type alias Model =
    { gamepads : List Gamepad }


type Msg
    = OnGamepad ( Time, Gamepad.Blob )



-- init


init : ( Model, Cmd Msg )
init =
    noCmd
        { gamepads = []
        }



-- update


noCmd : Model -> ( Model, Cmd msg )
noCmd model =
    ( model, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnRemapMsg ( elapsedTime, gamepads ) ->
            noCmd { model | gamepads = gamepads }



-- view


viewGamepad : Gamepad -> ( Int, Html Msg )
viewGamepad gamepad =
    let
        index =
            Gamepad.getIndex gamepad

        viewControl : (Gamepad -> a) -> String -> Html msg
        viewControl getter name =
            li
                []
                [ text <| name ++ ": " ++ toString (getter gamepad) ]
    in
        ( index
        , div
            []
            [ ul
                []
                [ viewControl Gamepad.aIsPressed "A"
                , viewControl Gamepad.bIsPressed "B"
                , viewControl Gamepad.xIsPressed "X"
                , viewControl Gamepad.yIsPressed "Y"
                , viewControl Gamepad.startIsPressed "Start"
                , viewControl Gamepad.backIsPressed "Back"
                , viewControl Gamepad.homeIsPressed "Home"
                , viewControl Gamepad.dpadX "Dpad X"
                , viewControl Gamepad.dpadY "Dpad Y"
                , viewControl Gamepad.leftX "Left X"
                , viewControl Gamepad.leftY "Left Y"
                , viewControl Gamepad.leftStickIsPressed "Left Stick"
                , viewControl Gamepad.leftBumperIsPressed "Left Bumper"
                , viewControl Gamepad.leftTriggerIsPressed "Left Trigger (digital)"
                , viewControl Gamepad.leftTriggerValue "Left Trigger (analog)"
                , viewControl Gamepad.rightX "Right X"
                , viewControl Gamepad.rightY "Right Y"
                , viewControl Gamepad.rightStickIsPressed "Right Stick"
                , viewControl Gamepad.rightBumperIsPressed "Right Bumper"
                , viewControl Gamepad.rightTriggerIsPressed "Right Trigger (digital)"
                , viewControl Gamepad.rightTriggerValue "Right Trigger (analog)"
                ]
            , div
                []
                [ viewRemapButton index ]
            ]
        )


view : Model -> Html Msg
view model =
    div
        []
        [ div
            []
            []
        , div
            []
            [ viewGamepadsBlob model model.gamepads
            ]
        ]



-- subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- main


main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
