port module Sponsoring exposing (..)

import Http
import BodyBuilder exposing (..)
import Elegant exposing (..)
import Color
import Json.Decode as Decode
import Json.Encode as Encode
import Card
import Function exposing (..)


main : Program Never Model Msg
main =
    program
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    { currentPage = StripeForm
    , stripePlan = Mensual
    , alertMessage = NoAlert
    , token = Nothing
    , creditCard = initialCreditCardModel
    , subscriptionResult = Nothing
    }


initialCreditCardModel : CreditCardModel
initialCreditCardModel =
    { email = ""
    , ccNumber = ""
    , expiration = ""
    , cvc = ""
    }


type alias Model =
    { currentPage : PageType
    , stripePlan : StripePlan
    , alertMessage : MessageAlertType
    , token : Maybe String
    , creditCard : CreditCardModel
    , subscriptionResult : Maybe String
    }


type MessageAlertType
    = NoAlert
    | WrongCardDetails


type alias CreditCardModel =
    { email : String
    , ccNumber : String
    , expiration : String
    , cvc : String
    }


type StripePlan
    = Mensual
    | Semestrial
    | Annual


type PageType
    = StripeForm
    | StripeAnswer



-- VIEW


view : Model -> Node Interactive NotPhrasing Spanning NotListElement Msg
view model =
    div [ style [ fontFamilySansSerif, textCenter ] ]
        [ h1 [ style [ marginVertical large ] ] [ text "Sponsoring Paris.rb" ]
        , case model.currentPage of
            StripeForm ->
                stripeForm model

            StripeAnswer ->
                stripeAnswer model.subscriptionResult
        ]


stripeAnswer : Maybe String -> Node interactiveContent phrasingContent Spanning NotListElement msg
stripeAnswer result =
    div [] [ text (Maybe.withDefault "NO RESULT" result) ]


stripeForm : Model -> Node Interactive NotPhrasing Spanning NotListElement Msg
stripeForm model =
    div []
        [ planSelectionButtons model.stripePlan
        , subscriptionForm model
        ]


alertContainer :
    MessageAlertType
    -> List (Node interactiveContent phrasingContent Spanning NotListElement msg)
    -> Node interactiveContent phrasingContent Spanning NotListElement msg
alertContainer msg =
    let
        alertMessageStyle =
            case msg of
                NoAlert ->
                    style [ displayNone ]

                WrongCardDetails ->
                    style
                        [ borderWidth 1
                        , borderSolid
                        , borderColor (Color.rgba 27 31 35 0.15)
                        , borderRadius 4
                        , backgroundColor (Color.rgb 255 220 224)
                        , formFieldFormat (Color.rgba 27 31 35 0.15)
                        ]
    in
        div [ alertMessageStyle ]


gray : Color.Color
gray =
    (Color.rgba 124 124 126 0.247)


formFieldContainer :
    List (Node interactiveContent phrasingContent Spanning NotListElement msg)
    -> Node interactiveContent phrasingContent Spanning NotListElement msg
formFieldContainer =
    div [ style [ formFieldFormat gray ] ]


formFieldFormat : Color.Color -> Style -> Style
formFieldFormat borderColorValue =
    [ borderSolid
    , borderRadius 4
    , borderWidth 1
    , overflowHidden
    , borderColor borderColorValue
    , marginBottom medium
    ]
        |> compose


baseInput : Style -> Style
baseInput =
    [ padding medium
    , borderNone
    , fontSize (Px 15)
    ]
        |> compose


subscriptionForm : Model -> Node Interactive NotPhrasing Spanning NotListElement Msg
subscriptionForm model =
    div
        [ style
            [ borderColor Color.grey
            , borderSolid
            , borderWidth 1
            , borderRadius 4
            , maxWidth (Px 300)
            , padding large
            , marginAuto
            , backgroundColor (Color.rgb 245 245 247)
            , displayFlex
            , flexDirectionColumn
            ]
        ]
        [ alertContainer model.alertMessage
            [ p [ style [ baseInput, margin (Px 0), textColor (Color.rgb 60 50 40) ] ] [ text "Attention, mauvaises données de carte bancaire" ] ]
        , formFieldContainer
            [ inputText [ style [ baseInput, fullWidth ], onInput (CreditCard << SetName), name "email", value model.creditCard.email, placeholder "email" ]
            ]
        , formFieldContainer
            [ inputText [ style [ baseInput, fullWidth, borderBottomColor gray, borderBottomSolid, borderBottomWidth 1 ], onInput (CreditCard << SetCcNumber), name "ccNumber", value (model.creditCard.ccNumber |> Card.numberFormat), placeholder "n° carte" ]
            , inputText [ style [ baseInput, Elegant.width (Percent 50), borderRightColor gray, borderRightSolid, borderRightWidth 1 ], onInput (CreditCard << SetExpiration), name "expiration", value (model.creditCard.expiration), placeholder "expiration" ]
            , inputText [ style [ baseInput, Elegant.width (Percent 50) ], onInput (CreditCard << SetCvc), name "cvc", value (model.creditCard.cvc |> Card.cvcFormat), placeholder "cvc" ]
            ]
        , button
            [ style
                [ backgroundColor (Color.rgb 197 66 76)
                , baseInput
                , textColor Color.white
                , bold
                , cursorPointer
                , borderRadius 4
                , marginTop medium
                , marginBottom medium
                ]
            , hoverStyle [ backgroundColor (Color.rgb 187 61 71) ]
            , onClick AskForToken
            ]
            [ text "Sponsoriser" ]
        , p [ style [ fontSize (Px 11), textColor Color.black ] ] [ text "La résiliation se fait par simple mail à thibaut@milesrock.com" ]
        ]


planSelectionButtons :
    StripePlan
    -> Node interactiveContent NotPhrasing Spanning NotListElement Msg
planSelectionButtons stripePlan =
    div []
        [ div [ style [ displayFlex, justifyContentCenter ] ]
            [ selectionButton Mensual "Mensuel" (Mensual == stripePlan)
            , selectionButton Semestrial "Semestriel" (Semestrial == stripePlan)
            , selectionButton Annual "Annuel" (Annual == stripePlan)
            ]
        , p [ style [ h1S, marginVertical medium ] ] [ stripePlanDescription stripePlan ]
        ]


selectionButton :
    StripePlan
    -> String
    -> Bool
    -> Node interactiveContent phrasingContent Spanning NotListElement Msg
selectionButton stripePlan label selected =
    let
        bg =
            if selected then
                Color.rgb 110 38 46
            else
                Color.rgb 197 66 76

        fg =
            if selected then
                Color.rgb 197 66 76
            else
                Color.rgb 245 245 247
    in
        div
            [ style
                [ h3S
                , textCenter
                , padding medium
                , textColor bg
                , backgroundColor fg
                , cursorPointer
                ]
            , hoverStyle
                [ textColor fg
                , backgroundColor bg
                ]
            , onClick (Select stripePlan)
            ]
            [ text label ]


stripePlanDescription :
    StripePlan
    -> Node interactiveContent phrasingContent spanningContent NotListElement msg
stripePlanDescription stripePlan =
    case stripePlan of
        Mensual ->
            text "450 € HT / mois"

        Semestrial ->
            text "3060 € (soit 425€ HT / mois)"

        Annual ->
            text "5832 € (soit 405€ HT / mois)"



-- UPDATE


type Msg
    = CreditCard CreditCardMsg
    | AskForToken
    | ReceiveToken String
    | ReceiveSubscription (Result Http.Error LambdaResponse)
    | Select StripePlan


type CreditCardMsg
    = SetName String
    | SetCcNumber String
    | SetExpiration String
    | SetCvc String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CreditCard creditCardMsg ->
            ( { model
                | alertMessage = NoAlert
                , creditCard =
                    updateCreditCard creditCardMsg model.creditCard
              }
            , Cmd.none
            )

        AskForToken ->
            ( model
            , askForToken model.creditCard
            )

        ReceiveToken token ->
            if token == "" then
                { model | alertMessage = WrongCardDetails } ! []
            else
                let
                    newModel =
                        { model | token = Just token }
                in
                    ( newModel
                    , sendSubscription newModel
                    )

        ReceiveSubscription result ->
            let
                message =
                    case result of
                        Err _ ->
                            "Une erreur est survenue, votre souscription n'a pas pu être enregistrée"

                        Ok _ ->
                            "Votre souscription a bien été enregistrée"
            in
                { model | currentPage = StripeAnswer, subscriptionResult = Just message } ! []

        Select plan ->
            ( { model | stripePlan = plan }, Cmd.none )


updateCreditCard : CreditCardMsg -> CreditCardModel -> CreditCardModel
updateCreditCard msg model =
    case msg of
        SetName email ->
            { model | email = email }

        SetCcNumber ccNumber ->
            { model | ccNumber = ccNumber |> Card.onlyNumbers }

        SetExpiration expiration ->
            { model | expiration = expiration |> Card.onlyNumbersAndSlash }

        SetCvc cvc ->
            { model | cvc = cvc |> Card.onlyNumbers }



-- PORTS


port askForToken : CreditCardModel -> Cmd msg


port receiveStripeToken : (String -> msg) -> Sub msg



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ receiveStripeToken ReceiveToken ]



-- HTTP.POST


sendSubscription : Model -> Cmd Msg
sendSubscription model =
    Http.send ReceiveSubscription (postSubscription model)


postSubscription : Model -> Http.Request LambdaResponse
postSubscription model =
    let
        endPoint =
            "https://n3t7k7q6h0.execute-api.eu-west-2.amazonaws.com/dev/stripePayment"

        stripePlanId =
            case model.stripePlan of
                Mensual ->
                    "mensual-parisrb"

                Semestrial ->
                    "semestrial ParisRB"

                Annual ->
                    "annual-parisrb"

        body =
            [ ( "stripePlanId", Encode.string stripePlanId )
            , ( "stripeEmail", Encode.string model.creditCard.email )
            , ( "stripeToken", Encode.string (Maybe.withDefault "" model.token) )
            ]
                |> Encode.object
                |> Http.jsonBody
    in
        Http.post endPoint body decodeLambdaResponse


type alias LambdaResponse =
    { message : String }


decodeLambdaResponse : Decode.Decoder LambdaResponse
decodeLambdaResponse =
    Decode.map LambdaResponse
        (Decode.field "message" Decode.string)
