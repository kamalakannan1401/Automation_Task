*** Settings ***
Documentation   Resource file hold keywords related to Login
Resource    ../../Page_Objects/Landing.resource
Resource    ../../Page_Objects/Login.resource
Variables   ../../../Variables/global_config_web.py
Library   SeleniumLibrary
Library   String

*** Keywords ***
Get Username and Password from Login Info
    [Documentation]     Keyword to get username from login information header
    ${login_info_text} =    Get Login Info Text
    @{username} =    Get Regexp Matches    ${login_info_text}    Enter (.*) for the username     1
    @{password} =    Get Regexp Matches    ${login_info_text}    and (.*) for the password     1
    ${match_count_username} =    Get Length    ${username}
    ${match_count_password} =    Get Length    ${password}
    IF    ${match_count_username} == 0
         Fail   Unable to retreive username from the login info header
    END
    IF    ${match_count_password} == 0
         Fail   Unable to retreive password from the login info header
    END
    [Return]    ${username}[0]  ${password}[0]

Login
    [Documentation]     Keyword to login
    [Arguments]     ${username}     ${password}
    Set Username    ${username}
    Set Password    ${password}
    Click Login Button

Verify Invalid Credentials
    [Documentation]     Keyword to verify invalid credentials
    [Arguments]     ${expected_message}
    Wait Until Keyword Succeeds    ${OBJECT_SYNC_MAX_TIMEOUT}
        ...     1    Element Should Contain    ${message}    ${expected_message}
        ...     message=Error message is not displayed as expected.
    Log    Error message is displayed as expected.
