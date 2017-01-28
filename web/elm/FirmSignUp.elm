module FirmSignUp exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


-- Model


type alias Model =
    { account : Account
    , profile : FirmProfile
    }


type alias Account =
    { firstName : String
    , lastName : String
    , emailAddress : String
    , phoneNumber : String
    , password : String
    , passwordConfirm : String
    }


type alias FirmProfile =
    { firmName : String
    , streetAddress1 : String
    , streetAddress2 : String
    , city : String
    , state : String
    , zip : String
    , areaOfFocus : String
    }


initModel : Model
initModel =
    { account =
        { firstName = ""
        , lastName = ""
        , emailAddress = ""
        , phoneNumber = ""
        , password = ""
        , passwordConfirm = ""
        }
    , profile =
        { firmName = ""
        , streetAddress1 = ""
        , streetAddress2 = ""
        , city = ""
        , state = ""
        , zip = ""
        , areaOfFocus = ""
        }
    }



-- Update


type Msg
    = FirstNameInput String
    | LastNameInput String
    | EmailAddressInput String
    | PhoneNumberInput String
    | PasswordInput String
    | PasswordConfirmInput String
    | FirmNameInput String
    | StreetAddress1Input String
    | StreetAddress2Input String
    | CityInput String
    | StateInput String
    | ZipInput String
    | AreaOfFocusInput String


update : Msg -> Model -> Model
update msg model =
    case msg of
        FirstNameInput firstName ->
            let
                account =
                    model.account
            in
                { model | account = { account | firstName = firstName } }

        LastNameInput lastName ->
            let
                account =
                    model.account
            in
                { model | account = { account | lastName = lastName } }

        EmailAddressInput emailAddress ->
            let
                account =
                    model.account
            in
                { model | account = { account | emailAddress = emailAddress } }

        PhoneNumberInput phoneNumber ->
            let
                account =
                    model.account
            in
                { model | account = { account | phoneNumber = phoneNumber } }

        PasswordInput password ->
            let
                account =
                    model.account
            in
                { model | account = { account | password = password } }

        PasswordConfirmInput passwordConfirm ->
            let
                account =
                    model.account
            in
                { model | account = { account | passwordConfirm = passwordConfirm } }

        FirmNameInput firmName ->
            let
                profile =
                    model.profile
            in
                { model | profile = { profile | firmName = firmName } }

        StreetAddress1Input streetAddress1 ->
            let
                profile =
                    model.profile
            in
                { model | profile = { profile | streetAddress1 = streetAddress1 } }

        StreetAddress2Input streetAddress2 ->
            let
                profile =
                    model.profile
            in
                { model | profile = { profile | streetAddress2 = streetAddress2 } }

        CityInput city ->
            let
                profile =
                    model.profile
            in
                { model | profile = { profile | city = city } }

        StateInput state ->
            let
                profile =
                    model.profile
            in
                { model | profile = { profile | state = state } }

        ZipInput zip ->
            let
                profile =
                    model.profile
            in
                { model | profile = { profile | zip = zip } }

        AreaOfFocusInput areaOfFocus ->
            let
                profile =
                    model.profile
            in
                { model | profile = { profile | areaOfFocus = areaOfFocus } }



-- View


view : Model -> Html Msg
view model =
    Html.form [ class "pure-form pure-form-stacked" ]
        [ fieldset []
            [ accountSection model
            , profileSection model
            ]
        ]


accountSection : Model -> Html Msg
accountSection model =
    div [ class "pure-g" ]
        [ div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "firstName" ] [ text "First Name" ]
            , input
                [ class "pure-u-23-24"
                , id "firstName"
                , type' "text"
                , onInput FirstNameInput
                , value model.account.firstName
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "emailAddress" ] [ text "Email Address" ]
            , input
                [ class "pure-u-23-24"
                , id "emailAddress"
                , type' "text"
                , onInput EmailAddressInput
                , value model.account.emailAddress
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "lastName" ] [ text "Last Name" ]
            , input
                [ class "pure-u-23-24"
                , id "lastName"
                , type' "text"
                , onInput LastNameInput
                , value model.account.lastName
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "password" ] [ text "Password" ]
            , input
                [ class "pure-u-23-24"
                , id "password"
                , type' "text"
                , onInput PasswordInput
                , value model.account.password
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "phoneNumber" ] [ text "Phone Number (optional)" ]
            , input
                [ class "pure-u-23-24"
                , id "phoneNumber"
                , type' "text"
                , onInput PhoneNumberInput
                , value model.account.phoneNumber
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "passwordConfirm" ] [ text "Confirm Password" ]
            , input
                [ class "pure-u-23-24"
                , id "passwordConfirm"
                , type' "text"
                , onInput PasswordConfirmInput
                , value model.account.passwordConfirm
                ]
                []
            ]
        ]


profileSection : Model -> Html Msg
profileSection model =
    div [ class "pure-g" ]
        [ div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "firmName" ] [ text "Firm Name" ]
            , input
                [ class "pure-u-23-24"
                , id "firmName"
                , type' "text"
                , onInput FirmNameInput
                , value model.profile.firmName
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "areaOfFocus" ] [ text "Area Of Focus" ]
            , select
                [ onInput AreaOfFocusInput
                , value model.profile.areaOfFocus
                ]
                [ option [] [ text "" ]
                , option [] [ text "Contracts & Agreements" ]
                , option [] [ text "Business Formation" ]
                , option [] [ text "Patents" ]
                , option [] [ text "Trademarks & Copyrights" ]
                , option [] [ text "Immigration" ]
                , option [] [ text "Real Estate" ]
                , option [] [ text "Labor & Employment" ]
                , option [] [ text "Ongoing Business Counsel" ]
                , option [] [ text "Lawsuits & Disputes" ]
                , option [] [ text "Website Agreements" ]
                , option [] [ text "Securities & Finance" ]
                , option [] [ text "Other" ]
                ]
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "streetAddress1" ] [ text "Street Address 1" ]
            , input
                [ class "pure-u-23-24"
                , id "streetAddress1"
                , type' "text"
                , onInput StreetAddress1Input
                , value model.profile.streetAddress1
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "streetAddress2" ] [ text "Street Address 2" ]
            , input
                [ class "pure-u-23-24"
                , id "streetAddress2"
                , type' "text"
                , onInput StreetAddress2Input
                , value model.profile.streetAddress2
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "city" ] [ text "City" ]
            , input
                [ class "pure-u-23-24"
                , id "City"
                , type' "text"
                , onInput CityInput
                , value model.profile.city
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-3" ]
            [ label [ for "state" ] [ text "State" ]
            , select
                [ onInput StateInput
                , value model.profile.state
                ]
                [ option [] [ text "" ]
                , option [] [ text "New York" ]
                , option [] [ text "Massachusetts" ]
                , option [] [ text "New Hampshire" ]
                , option [] [ text "Pennsylvania" ]
                , option [] [ text "Rhode Island" ]
                , option [] [ text "Vermont" ]
                ]
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ label [ for "zip" ] [ text "Zip" ]
            , input
                [ class "pure-u-23-24"
                , id "zip"
                , type' "text"
                , onInput ZipInput
                , value model.profile.zip
                ]
                []
            ]
        ]



{-
   view model =
       div []
           [ h3 [] [ text "Account" ]
           , input
               [ type' "text"
               , onInput FirstNameInput
               , placeholder "First Name"
               ]
               []
           , input
               [ type' "text"
               , onInput LastNameInput
               , placeholder "Last Name"
               ]
               []
           , input
               [ type' "text"
               , onInput EmailAddressInput
               , placeholder "Email Address"
               ]
               []
           , input
               [ type' "text"
               , onInput PhoneNumberInput
               , placeholder "Phone Number"
               ]
               []
           , input
               [ type' "text"
               , onInput PasswordInput
               , placeholder "Password"
               ]
               []
           , input
               [ type' "text"
               , onInput PasswordConfirmInput
               , placeholder "Repeat Password"
               ]
               []
           , h3 [] [ text "Profile" ]
           , input
               [ type' "text"
               , onInput FirmNameInput
               , placeholder "Firm Name"
               ]
               []
           , input
               [ type' "text"
               , onInput StreetAddress1Input
               , placeholder "Street Address 1"
               ]
               []
           , input
               [ type' "text"
               , onInput StreetAddress2Input
               , placeholder "Street Address 2"
               ]
               []
           , input
               [ type' "text"
               , onInput CityInput
               , placeholder "City"
               ]
               []
           , select
               [ onInput StateInput
               ]
               [ option [] [ text <| "State" ]
               , option [] [ text <| "New York" ]
               , option [] [ text <| "Massachusetts" ]
               , option [] [ text <| "New Hampshire" ]
               , option [] [ text <| "Pennsylvania" ]
               , option [] [ text <| "Rhode Island" ]
               , option [] [ text <| "Vermont" ]
               ]
           , input
               [ type' "text"
               , onInput ZipInput
               , placeholder "Zip"
               ]
               []
           , select
               [ onInput AreaOfFocusInput
               ]
               [ option [] [ text <| "Area of Focus" ]
               , option [] [ text <| "Contracts & Agreements" ]
               , option [] [ text <| "Business Formation" ]
               , option [] [ text <| "Patents" ]
               , option [] [ text <| "Trademarks & Copyrights" ]
               , option [] [ text <| "Immigration" ]
               , option [] [ text <| "Real Estate" ]
               , option [] [ text <| "Labor & Employment" ]
               , option [] [ text <| "Ongoing Business Counsel" ]
               , option [] [ text <| "Lawsuits & Disputes" ]
               , option [] [ text <| "Website Agreements" ]
               , option [] [ text <| "Securities & Finance" ]
               , option [] [ text <| "Other" ]
               ]
           , div []
               [ button
                   [ type' "submit" ]
                   [ text "Submit" ]
               ]
           , hr [] []
           , h4 [] [ text "FirmSignUp Model:" ]
           , p [] [ text <| toString model ]
           ]
-}


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
