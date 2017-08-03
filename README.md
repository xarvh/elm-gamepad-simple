Elm Gamepad Simple
==================

A wrapper around [Elm Gamepad](#TODO).

The library handles all gamepad configuration and remapping for you.

When the user is remapping a gamepad, it will automatically suspend the app.

To work, the library requires to manually add `port` module and use the
provided `index.html` (see [below](#Setup)).


```elm
import GamepadPorts
import Gamepad.Simple exposing (Gamepad)


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
```


Setup
=====

Setting up the library requires some manual wiring:

1. Run `elm-package install --yes xarvh/elm-gamepad-simple`
1. Copy [GamepadPorts.elm](#TODO) in your Elm source directory.
1. Copy [index.html](#TODO) somewhere.
1. Replace `Html.program` with `Gamepad.Simple.program`
1. Build with `elm-make --output=app.js`, ensure that `app.js` is created in the same directory where you placed `index.html`.
1. Open `index.html`.

