module Pack exposing (..)

import Html
import List


pack : List a -> List (List a)
pack xs =
    case xs of
        [] ->
            []

        y :: ys ->
            pack2 y [ y ] ys


pack2 : a -> List a -> List a -> List (List a)
pack2 v run xs =
    case xs of
        [] ->
            [ run ]

        y :: ys ->
            if y == v then
                pack2 y (y :: run) ys

            else
                run :: pack2 y [ y ] ys


main : Html.Html a
main =
    Html.text <|
        case test of
            0 ->
                "Your implementation passed all tests."

            1 ->
                "Your implementation failed one test."

            x ->
                "Your implementation failed " ++ String.fromInt x ++ " tests."


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ pack [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ] == [ [ 1, 1, 1, 1 ], [ 2 ], [ 5, 5 ], [ 2 ], [ 1 ] ]
            , pack [ 2, 1, 1, 1 ] == [ [ 2 ], [ 1, 1, 1 ] ]
            , pack [ 2, 2, 2, 1, 1, 1 ] == [ [ 2, 2, 2 ], [ 1, 1, 1 ] ]
            , pack [ 1 ] == [ [ 1 ] ]
            , pack [] == []
            , pack [ "aa", "aa", "aa" ] == [ [ "aa", "aa", "aa" ] ]
            , pack [ "aab", "b", "b", "aa" ] == [ [ "aab" ], [ "b", "b" ], [ "aa" ] ]
            ]
