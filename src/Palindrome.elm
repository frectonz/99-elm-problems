module Palindrome exposing (..)

import Browser
import Html exposing (Html, br, div, input, span, text)
import Html.Attributes exposing (value)
import Html.Events exposing (onInput)



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    String


init : Model
init =
    ""



-- UPDATE


type Msg
    = ChangeString String


update : Msg -> Model -> Model
update msg _ =
    case msg of
        ChangeString newStr ->
            newStr



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ input [ value model, onInput ChangeString ] []
        , br [] []
        , checkPalindrome model
        ]


checkPalindrome : String -> Html msg
checkPalindrome string =
    if string == "" then
        span [] []

    else if isPalindrome string then
        span [] [ text (string ++ " is a palindrome") ]

    else
        span [] [ text (string ++ " is not a palindrom") ]


isPalindrome : String -> Bool
isPalindrome string =
    String.reverse string == string
