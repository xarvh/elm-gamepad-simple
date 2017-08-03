port module GamepadPort exposing (ports)

import Gamepad.Simple
import Time exposing (Time)


port gamepad : (( Time, Gamepad.Simple.Blob ) -> msg) -> Sub msg


port localStorageSet : { key : String, value : String } -> Cmd msg


ports : Gamepad.Simple.Ports
ports =
    { gamepad = gamepad
    , localStorageSet = \key value -> localStorageSet { key = key, value = value }
    }
