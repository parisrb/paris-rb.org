module Card exposing (..)

import List exposing (map)
import String exposing (slice, length, left, dropLeft, join)
import Regex


limitSize : Int -> String -> String
limitSize =
    String.slice 0


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
putSpacesEvery len =
    splitEvery len >> join " "


removeRegex : String -> String -> String
removeRegex regex =
    Regex.replace Regex.All (Regex.regex regex) (\_ -> "")


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


cardNumberDisplay : String -> String
cardNumberDisplay =
    putSpacesEvery 4


cardNumberFormat : String -> String
cardNumberFormat =
    onlyNumbers >> limitSize 16


cvcFormat : String -> String
cvcFormat =
    onlyNumbers >> limitSize 4


dateFormat : String -> String
dateFormat =
    onlyNumbersAndSlash >> addSlashForThreeNumbers >> limitSize 7


addSlashForThreeNumbers : String -> String
addSlashForThreeNumbers =
    Regex.replace Regex.All (Regex.regex "^([0-9]{3,})$") (\{ match } -> (splitAt 2 >> join "/") match)
