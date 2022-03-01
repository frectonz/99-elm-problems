module RleEncode exposing (..)

import DropWhile exposing (dropWhile)
import Html
import List
import TakeWhile exposing (takeWhile)


type RleCode a
    = Run Int a
    | Single a


rleEncode : List a -> List (RleCode a)
rleEncode list =
    case list of
        [] ->
            []

        hd :: tl ->
            let
                remainder =
                    dropWhile (\x -> x == hd) tl

                front =
                    takeWhile (\x -> x == hd) list
            in
            case List.length front of
                0 ->
                    rleEncode remainder

                1 ->
                    Single hd :: rleEncode remainder

                n ->
                    Run n hd :: rleEncode remainder


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
            [ rleEncode [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ]
                == [ Run 4 1, Single 2, Run 2 5, Single 2, Single 1 ]
            , rleEncode [ 2, 1, 1, 1 ] == [ Single 2, Run 3 1 ]
            , rleEncode [ 2, 2, 2, 1, 1, 1 ] == [ Run 3 2, Run 3 1 ]
            , rleEncode [ 1 ] == [ Single 1 ]
            , rleEncode [] == []
            , rleEncode [ "aa", "aa", "aa" ] == [ Run 3 "aa" ]
            , rleEncode [ "aab", "b", "b", "aa" ]
                == [ Single "aab", Run 2 "b", Single "aa" ]
            ]
