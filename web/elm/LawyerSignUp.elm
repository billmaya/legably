module LawyerSignUp exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import Exts.Html exposing (..)


-- Model


type alias Model =
    { account : Account
    , profile : LawyerProfile
    }


type alias Account =
    { firstName : String
    , lastName : String
    , emailAddress : String
    , phoneNumber : String
    , password : String
    , passwordConfirm : String
    }


type alias LawyerProfile =
    { currentBarId : String
    , currentBarState : String
    , barList : List BarId
    }


type alias BarId =
    { barId : String
    , barState : String
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
        { currentBarId = ""
        , currentBarState = ""
        , barList = []
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
    | BarIdInput String
    | BarStateInput String
    | AddBarId
    | RemoveBarId BarId


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

        BarIdInput currentBarId ->
            let
                profile =
                    model.profile
            in
                { model | profile = { profile | currentBarId = currentBarId } }

        BarStateInput currentBarState ->
            let
                profile =
                    model.profile
            in
                { model | profile = { profile | currentBarState = currentBarState } }

        AddBarId ->
            let
                profile =
                    model.profile

                newBarItem =
                    BarId profile.currentBarId profile.currentBarState
            in
                { model
                    | profile =
                        { profile
                            | currentBarId = ""
                            , currentBarState = ""
                            , barList = newBarItem :: profile.barList
                        }
                }

        RemoveBarId barId ->
            removeBarId model barId


removeBarId : Model -> BarId -> Model
removeBarId model barId =
    let
        profile =
            model.profile

        barList =
            profile.barList

        newBarList =
            List.filter (\p -> p.barId /= barId.barId) barList
    in
        { model
            | profile =
                { profile
                    | barList = newBarList
                }
        }



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
        [ div [ class "pure-u-1 pure-u-md-1-3" ]
            [ label [ for "barId" ] [ text "Bar ID" ]
            , input
                [ class "pure-u-23-24"
                , id "barId"
                , type' "text"
                , onInput BarIdInput
                , value model.profile.currentBarId
                ]
                []
            ]
        , div [ class "pure-u-1 pure-u-md-1-3" ]
            [ label [ for "barState" ] [ text "State Barred In" ]
            , select
                [ onInput BarStateInput
                , value model.profile.currentBarState
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
        , div
            [ class "pure-u-1 pure-u-md-1-3"
            , style
                [ ( "text-align", "left" )
                ]
            ]
            [ label [] [ text Exts.Html.nbsp ]
            , button
                [ class "pure-button"
                , type' "button"
                , onClick AddBarId
                ]
                [ text " + " ]
            ]
        , div [ class "pure-u-1 pure-u-md-1-2" ]
            [ barListHeader
            , div [ class "pure-u-1 pure-u-md-1-2" ]
                [ barList model ]
            ]
        ]


barListHeader : Html Msg
barListHeader =
    header []
        [ div [] [ text "Bar ID" ]
        , div [] [ text "Bar State" ]
        ]


barList : Model -> Html Msg
barList model =
    let
        profile =
            model.profile
    in
        profile.barList
            |> List.map barItem
            |> ul []


barItem : BarId -> Html Msg
barItem item =
    li []
        [ i
            [ class "remove"
            , onClick (RemoveBarId item)
            ]
            []
        , div [] [ text item.barId ]
        , div [] [ text item.barState ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
