module Main exposing (..)

-- From Main-modified.elm

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import LawyerSignUp
import FirmSignUp


-- Model


type alias Model =
    { page : Page
    , lawyerSignUp : LawyerSignUp.Model
    , firmSignUp : FirmSignUp.Model
    }


type Page
    = LawyerSignUpPage
    | FirmSignUpPage


initModel : Model
initModel =
    { page = LawyerSignUpPage
    , lawyerSignUp = LawyerSignUp.initModel
    , firmSignUp = FirmSignUp.initModel
    }



-- Update


type Msg
    = ChangePage Page
    | LawyerSignUpMsg LawyerSignUp.Msg
    | FirmSignUpMsg FirmSignUp.Msg
    | AcceptTermsAndConditions


update : Msg -> Model -> Model
update msg model =
    case msg of
        ChangePage page ->
            { model
                | page = page
            }

        LawyerSignUpMsg lawyerMsg ->
            { model
                | lawyerSignUp =
                    LawyerSignUp.update lawyerMsg model.lawyerSignUp
            }

        FirmSignUpMsg firmMsg ->
            { model
                | firmSignUp =
                    FirmSignUp.update firmMsg model.firmSignUp
            }

        _ ->
            model



-- View


view : Model -> Html Msg
view model =
    div []
        [ header
        , splashContainer
        , contentWrapper model
        ]


header : Html Msg
header =
    div [ class "header" ]
        [ div [ class "home-menu pure-menu pure-menu-horizontal pure-menu-fixed" ]
            [ a [ class "pure-menu-heading", href "" ]
                [ text "Legably" ]
            , ul [ class "pure-menu-list" ]
                [ li [ class "pure-menu-item" ]
                    [ a [ class "pure-menu-link", href "#" ]
                        [ text "About" ]
                    ]
                , li [ class "pure-menu-item" ]
                    [ a [ class "pure-menu-link", href "#" ]
                        [ text "Log In" ]
                    ]
                ]
            ]
        ]


splashContainer : Html Msg
splashContainer =
    div [ class "splash-container" ]
        [ div [ class "splash" ]
            [ h1 [ class "splash-head" ]
                [ text "Lorem ipsum dolor sit amet, consectetur adipiscing." ]
            , p [ class "splash-subhead" ]
                [ text "Pellentesque volutpat blandit finibus. Donec lacinia rhoncus tortor ac congue. Nulla nunc quam, ultricies sed." ]
            ]
        ]


contentWrapper : Model -> Html Msg
contentWrapper model =
    let
        page =
            case model.page of
                LawyerSignUpPage ->
                    App.map LawyerSignUpMsg
                        (LawyerSignUp.view model.lawyerSignUp)

                FirmSignUpPage ->
                    App.map FirmSignUpMsg
                        (FirmSignUp.view model.firmSignUp)
    in
        div [ class "content-wrapper" ]
            [ div [ class "content" ]
                [ div [ style [ ( "text-align", "center" ) ] ]
                    [ a
                        [ href "#tabs"
                        , onClick (ChangePage LawyerSignUpPage)
                        , class "pure-button"
                        ]
                        [ i [ class "fa fa-user" ] []
                        , text " Lawyer Sign Up"
                        ]
                    , span [] [ text "   " ]
                    , a
                        [ href "#tabs"
                        , onClick (ChangePage FirmSignUpPage)
                        , class "pure-button"
                        ]
                        [ i [ class "fa fa-inbox" ] []
                        , text " Firm Sign Up"
                        ]
                    ]
                , hr [] []
                , div [ id "tabs" ] [ page ]
                , hr [] []
                , button [ class "pure-button pure-button-primary", type' "submit" ] [ text "Sign Up" ]
                , checkbox AcceptTermsAndConditions "Accept "
                , a [ href "#" ] [ text "Terms & Conditions" ]
                  -- , h4 [] [ text "App Model:" ]
                  -- , p [] [ text <| toString model ]
                ]
            ]


checkbox : msg -> String -> Html msg
checkbox msg name =
    label
        [ style [ ( "padding", "20px" ) ] ]
        [ input [ type' "checkbox", onClick msg ] [], text name ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
