*** Settings ***
Documentation   Resource file hold keywords related to Home Page
Resource    ../../Page_Objects/Login.resource
Resource    ../../Page_Objects/Home.resource
Variables   ../../../Variables/global_config_web.py
Library   SeleniumLibrary

*** Keywords ***
Verify Valid Login
    [Documentation]     Keyword to verify valid login
    [Arguments]     ${expected_message}
    Wait Until Keyword Succeeds    ${OBJECT_SYNC_MAX_TIMEOUT}
        ...     1    Element Should Contain    ${message}    ${expected_message}
        ...     message=User is not logged in to the application
    Log    User is logged in to the application successfully

Logout
    [Documentation]     Keyword to click Logout button
    Click Element    ${button_logout}