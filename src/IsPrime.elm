module IsPrime exposing (..)

import Html


isPrime : Int -> Bool
isPrime n =
    List.range 1 (n + 1)
        |> List.map (\x -> modBy x n == 0)
        |> List.filter ((==) True)
        |> List.length
        |> (==) 2


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
        List.filter (\( result, expect ) -> result /= expect)
            [ ( isPrime 36, False )
            , ( isPrime 10, False )
            , ( isPrime -1, False )
            , ( isPrime 1, False )
            , ( isPrime 0, False )
            , ( isPrime 120, False )
            , ( isPrime 2, True )
            , ( isPrime 23, True )
            , ( isPrime 6000, False )
            , ( isPrime 7919, True )
            , ( isPrime 7911, False )
            , ( isPrime 63247, True )
            , ( isPrime 63249, False )
            ]
