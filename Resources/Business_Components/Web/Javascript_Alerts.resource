*** Settings ***
Documentation   Resource file hold keywords related to JavaScript Alerts
Resource    ../../Page_Objects/Javascript_Alerts.resource
Variables   ../../../Variables/global_config_web.py
Library   SeleniumLibrary

*** Keywords ***
Verify Cancelled Message
    [Documentation]     Keyword to verify alert cancelled message
    [Arguments]     ${expected_message}
    Wait Until Keyword Succeeds    ${OBJECT_SYNC_MAX_TIMEOUT}
        ...     1    Element Text Should Be    ${result}    ${expected_message}
    ${actual_message} =     Get Text    ${result}
    Log    Alert cancellation message is displayed as expected. Expected : ${expected_message}, Actual : ${actual_message}