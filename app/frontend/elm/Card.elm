module Card exposing (..)

import List exposing (map)
import String exposing (slice, length, left, dropLeft, join)
import Regex


limitSize : Int -> String -> String
limitSize len str =
    String.slice 0 len str


splitAt : Int -> String -> List String
splitAt pos str =
    if length str > pos then
        [ left pos str, dropLeft pos str ]
    else
        [ str ]


splitAtCouple : Int -> String -> ( String, String )
splitAtCouple pos str =
    ( left pos str, dropLeft pos str )


splitEvery : Int -> String -> List String
splitEvery pos str =
    if length str > pos then
        let
            ( head, tail ) =
                splitAtCouple pos str
        in
            head :: splitEvery pos tail
    else
        [ str ]


putSpacesEvery : Int -> String -> String
putSpacesEvery len str =
    str
        |> splitEvery len
        |> join " "


removeRegex : String -> String -> String
removeRegex regex text =
    text
        |> Regex.replace Regex.All (Regex.regex regex) (\_ -> "")


onlyNumbers : String -> String
onlyNumbers =
    removeRegex "\\D"


onlyNumbersAndSlash : String -> String
onlyNumbersAndSlash =
    Regex.replace Regex.All
        (Regex.regex "\\D")
        (\{ match } ->
            if match == "/" then
                "/"
            else
                ""
        )


removeSpace : String -> String
removeSpace =
    removeRegex " "


numberFormat : String -> String
numberFormat text =
    text
        |> onlyNumbers
        |> limitSize 16
        |> putSpacesEvery 4


cvcFormat : String -> String
cvcFormat text =
    text
        |> onlyNumbers
        |> limitSize 4


dateFormat : String -> String
dateFormat text =
    text
        |> onlyNumbers
        |> limitSize 6
        |> splitAt 2
        |> join " / "
