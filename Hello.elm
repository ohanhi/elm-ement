port module Hello exposing (..)

import Html exposing (Html)


type Msg
    = Increment
    | SetGreeting String


type alias Model =
    { count : Int
    , greeting : String
    }


model : Model
model =
    { count = 0
    , greeting = "Hello"
    }


port increment : (() -> msg) -> Sub msg


port greeting : (String -> msg) -> Sub msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( { model | count = model.count + 1 }, Cmd.none )

        SetGreeting greeting ->
            ( { model | greeting = greeting }, Cmd.none )


view : Model -> Html msg
view { count, greeting } =
    Html.text (greeting ++ " Web Components! Increments done: " ++ toString count)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ increment (\_ -> Increment)
        , greeting SetGreeting
        ]


main : Program Never Model Msg
main =
    Html.program
        { init = ( model, Cmd.none )
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
