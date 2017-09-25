port module Sponsoring exposing (..)

import Http
import BodyBuilder exposing (..)
import Elegant exposing (..)
import Color
import Json.Decode as Decode
import Json.Encode as Encode
import Task
import Regex
import Card
import Function exposing (..)
import Task
import Date
import Date.Extra
import Date.Format
import Date.Local


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
    ( initialModel, Task.perform SetDate Date.now )


initialModel : Model
initialModel =
    { currentPage = StripeForm
    , stripePlan = Mensual
    , alertMessage = NoAlert
    , token = Nothing
    , sponsorDetails = initialSponsorDetails
    , creditCard = initialCreditCard
    , subscriptionResult = Nothing
    , maybeDate = Nothing
    , why = False
    }


initialSponsorDetails : SponsorDetails
initialSponsorDetails =
    { companyName = ""
    , firstName = ""
    , lastName = ""
    }


initialCreditCard : CreditCard
initialCreditCard =
    { email = ""
    , ccNumber = ""
    , expiration = ""
    , cvc = ""
    }


type alias Model =
    { currentPage : PageType
    , stripePlan : StripePlan
    , alertMessage : AlertMessage
    , token : Maybe String
    , sponsorDetails : SponsorDetails
    , creditCard : CreditCard
    , subscriptionResult : Maybe String
    , maybeDate : Maybe Date.Date
    , why : Bool
    }


type AlertMessage
    = NoAlert
    | WrongCardDetails
    | WrongSponsorDetails


type alias SponsorDetails =
    { companyName : String
    , firstName : String
    , lastName : String
    }


type alias CreditCard =
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
        [ planSelectionButtons model.stripePlan model.maybeDate model.why
        , subscriptionForm model
        ]


alertContainer :
    AlertMessage
    -> List (Node interactiveContent phrasingContent Spanning NotListElement msg)
    -> Node interactiveContent phrasingContent Spanning NotListElement msg
alertContainer msg =
    let
        alertMessageStyle =
            case msg of
                NoAlert ->
                    style [ displayNone ]

                _ ->
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


alertMessage : AlertMessage -> String
alertMessage msg =
    case msg of
        NoAlert ->
            ""

        WrongCardDetails ->
            "Attention, mauvaises données de carte bancaire"

        WrongSponsorDetails ->
            "Attention, mauvaises informations de société"


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


type BorderSide
    = NoBorder
    | Right
    | Bottom


fieldInput :
    String
    -> String
    -> String
    -> (String -> msg)
    -> Float
    -> BorderSide
    -> Node Interactive phrasingContent spanningContent listContent msg
fieldInput nameContent valueContent placeholderContent onInputContent widthPercent borderSide =
    let
        border =
            case borderSide of
                NoBorder ->
                    []

                Right ->
                    [ borderRightColor gray
                    , borderRightSolid
                    , borderRightWidth 1
                    ]

                Bottom ->
                    [ borderBottomColor gray
                    , borderBottomSolid
                    , borderBottomWidth 1
                    ]
    in
        inputText
            [ style
                [ baseInput
                , Elegant.width (Percent widthPercent)
                , border |> compose
                ]
            , name nameContent
            , value valueContent
            , placeholder placeholderContent
            , onInput onInputContent
            ]


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
            [ p
                [ style
                    [ baseInput
                    , margin (Px 0)
                    , textColor (Color.rgb 60 50 40)
                    ]
                ]
                [ text (alertMessage model.alertMessage) ]
            ]
        , formFieldContainer
            [ fieldInput
                "companyName"
                model.sponsorDetails.companyName
                "Société / Raison sociale"
                (SponsorDetailsWrapper << SetCompanyName)
                100
                NoBorder
            ]
        , formFieldContainer
            [ fieldInput
                "firstName"
                model.sponsorDetails.firstName
                "Prénom"
                (SponsorDetailsWrapper << SetFirstName)
                50
                Right
            , fieldInput
                "lastName"
                model.sponsorDetails.lastName
                "NOM"
                (SponsorDetailsWrapper << SetLastName)
                50
                NoBorder
            ]
        , formFieldContainer
            [ fieldInput
                "email"
                model.creditCard.email
                "Email"
                (CreditCardWrapper << SetEmail)
                100
                NoBorder
            ]
        , formFieldContainer
            [ fieldInput
                "ccNumber"
                (model.creditCard.ccNumber |> Card.cardNumberDisplay)
                "N° carte"
                (CreditCardWrapper << SetCcNumber)
                100
                Bottom
            , fieldInput
                "expiration"
                model.creditCard.expiration
                "Expiration"
                (CreditCardWrapper << SetExpiration)
                50
                Right
            , fieldInput
                "cvc"
                model.creditCard.cvc
                "Cvc"
                (CreditCardWrapper << SetCvc)
                50
                NoBorder
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
            , onClick ValidateSponsorDetails
            ]
            [ text "Sponsoriser" ]
        , p [ style [ fontSize (Px 11), textColor Color.black ] ] [ text "La résiliation se fait par simple mail à thibaut@milesrock.com" ]
        ]


nextMeetup : Date.Date -> Date.Date
nextMeetup date =
    let
        currentMonthMeetup =
            date
                |> Date.Extra.floor Date.Extra.Month
                |> Date.Extra.ceiling Date.Extra.Tuesday

        nextMonthMeetup =
            date
                |> Date.Extra.ceiling Date.Extra.Month
                |> Date.Extra.ceiling Date.Extra.Tuesday
    in
        if date |> Date.Extra.isBetween currentMonthMeetup nextMonthMeetup then
            nextMonthMeetup
        else
            currentMonthMeetup


frenchFormat : Date.Date -> String
frenchFormat =
    Date.Format.localFormat Date.Local.french "%e %B" >> String.toLower


whyView : Node interactiveContent NotPhrasing Spanning NotListElement msg
whyView =
    div [ style [ backgroundColor Color.white, textColor Color.black, padding (Px 24), margin (Px 24), maxWidth (Px 600), marginAuto ] ]
        [ h3 [ style [ paddingBottom (Px 24) ] ] [ text "Sponsoriser, c'est développer la communauté !" ]
        , p [ style [ textLeft, paddingBottom (Px 24) ] ] [ text "Ça nous permet d'organiser des évènements de qualité, où la nourriture reste gratuite pour les participants." ]
        , p [ style [ textLeft, paddingBottom (Px 24) ] ] [ text "Être partenaire de ParisRB vous apporte une crédibilité auprès des développeurs ruby. Vous devenez une société connue des développeurs, et participez activement au développement de ruby en France." ]
        , p [ style [ textLeft, paddingBottom (Px 24) ] ] [ text "Votre logo est visible sur le meetup, ainsi que sur le site, ainsi que sur les vidéos qui sortent de l'évènement mensuel, et vous avez aussi droit à 5 minutes de présentation de votre société par mois, ce qui est clé si vous voulez recruter." ]
        , p [ style [ textLeft, fontSize (Px 12) ] ] [ text "Hexagonal consulting, Kosmogo et Appaloosa sont aujourd'hui partenaires, et de nombreuses sociétés telles que Keycoopt, Jobteaser, Hired, Scalingo, Mipise, Cosmic, Edgar People, Vodeclic, Aircall, Shopify, Doctolib, Drivy, Dimelo, Sociabliz, Follow analytics, Figaro classified, Google nous ont aussi supporté par le passé. Et nous serons toujours reconnaissant de tous ces partenaires qui nous ont permis de faire de ParisRB ce que c'est devenu." ]
        ]


planSelectionButtons :
    StripePlan
    -> Maybe Date.Date
    -> Bool
    -> Node Interactive NotPhrasing Spanning NotListElement Msg
planSelectionButtons stripePlan currentDate why =
    div []
        [ div [ style [ displayFlex, justifyContentCenter ] ]
            [ selectionButton Mensual "Mensuel" (Mensual == stripePlan)
            , selectionButton Semestrial "Semestriel" (Semestrial == stripePlan)
            , selectionButton Annual "Annuel" (Annual == stripePlan)
            ]
        , p [ style [ h1S, marginVertical medium ] ]
            [ stripePlanDescription stripePlan
            ]
        , div []
            (case currentDate of
                Nothing ->
                    []

                Just date ->
                    [ a [ style [ cursorPointer ], onClick ToggleWhy ] [ text ("Pourquoi sponsoriser ParisRB ?") ]
                    , (if why then
                        whyView
                       else
                        text ""
                      )
                    , p [] [ text ("Votre premier meetup sponsorisé aura lieu le mardi " ++ (frenchFormat (nextMeetup date))) ]
                    ]
            )
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
    = CreditCardWrapper CreditCardMsg
    | SponsorDetailsWrapper SponsorDetailsMsg
    | ValidateSponsorDetails
    | AskForToken
    | ReceiveToken String
    | ReceiveSubscription (Result Http.Error LambdaResponse)
    | Select StripePlan
    | SetDate Date.Date
    | ToggleWhy


type CreditCardMsg
    = SetEmail String
    | SetCcNumber String
    | SetExpiration String
    | SetCvc String


type SponsorDetailsMsg
    = SetCompanyName String
    | SetFirstName String
    | SetLastName String


performMsg : msg -> Cmd msg
performMsg msg =
    Task.succeed msg
        |> Task.perform identity


validSponsorDetails : SponsorDetails -> Bool
validSponsorDetails model =
    let
        validate str =
            Regex.contains (Regex.regex "^[A-Za-z0-9 _-]{2,}$") str
    in
        validate model.companyName
            && validate model.firstName
            && validate model.lastName


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CreditCardWrapper creditCardMsg ->
            ( { model
                | alertMessage = NoAlert
                , creditCard =
                    updateCreditCard creditCardMsg model.creditCard
              }
            , Cmd.none
            )

        SponsorDetailsWrapper sponsorDetailsMsg ->
            ( { model
                | alertMessage = NoAlert
                , sponsorDetails =
                    updateSponsorDetails sponsorDetailsMsg model.sponsorDetails
              }
            , Cmd.none
            )

        ValidateSponsorDetails ->
            case (validSponsorDetails model.sponsorDetails) of
                True ->
                    ( model, performMsg AskForToken )

                False ->
                    { model | alertMessage = WrongSponsorDetails } ! []

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

        SetDate date ->
            ( { model | maybeDate = Just date }, Cmd.none )

        ToggleWhy ->
            ( { model | why = not model.why }, Cmd.none )


updateCreditCard : CreditCardMsg -> CreditCard -> CreditCard
updateCreditCard msg model =
    case msg of
        SetEmail email ->
            { model | email = email }

        SetCcNumber ccNumber ->
            { model | ccNumber = ccNumber |> Card.cardNumberFormat }

        SetExpiration expiration ->
            { model | expiration = expiration |> Card.dateFormat }

        SetCvc cvc ->
            { model | cvc = cvc |> Card.cvcFormat }


updateSponsorDetails : SponsorDetailsMsg -> SponsorDetails -> SponsorDetails
updateSponsorDetails msg model =
    case msg of
        SetCompanyName input ->
            { model | companyName = input }

        SetFirstName input ->
            { model | firstName = input }

        SetLastName input ->
            { model | lastName = input }



-- PORTS


port askForToken : CreditCard -> Cmd msg


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
