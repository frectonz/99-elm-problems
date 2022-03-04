module RleDecode exposing (..)

import Html
import List


type RleCode a
    = Run Int a
    | Single a


rleDecode : List (RleCode a) -> List a
rleDecode list =
    List.concatMap
        (\code ->
            case code of
                Single x ->
                    [ x ]

                Run n x ->
                    List.repeat n x
        )
        list


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
            [ rleDecode [ Run 4 1, Single 2, Run 2 5, Single 2, Single 1 ]
                == [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ]
            , rleDecode [ Run 4 1, Single 2, Run 2 5, Single 2, Single 1 ]
                == [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ]
            , rleDecode [ Run 4 "1", Single "b", Run 2 "5", Single "2", Single "a" ]
                == [ "1", "1", "1", "1", "b", "5", "5", "2", "a" ]
            ]
