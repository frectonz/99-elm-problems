module Duplicate exposing (..)

import Html exposing (Html, text)
import List


duplicate : List a -> List a
duplicate list =
    List.foldr (\x acc -> x :: x :: acc) [] list


main : Html msg
main =
    text
        (if test then
            "Your implementation passed all tests."

         else
            "Your implementation failed at least one test."
        )


test : Bool
test =
    List.all (\( result, expect ) -> result == expect)
        [ ( duplicate [ 1, 2, 3, 5, 8, 8 ], [ 1, 1, 2, 2, 3, 3, 5, 5, 8, 8, 8, 8 ] )
        , ( duplicate [], [] )
        , ( duplicate [ 1 ], [ 1, 1 ] )
        ]
        && List.all (\( result, expect ) -> result == expect)
            [ ( duplicate [ "1", "2", "5" ]
              , [ "1", "1", "2", "2", "5", "5" ]
              )
            ]
