*** Settings ***
Documentation   Resource file hold keywords related to Dynamic Loading functionality
Resource    ../../Page_Objects/Dynamic_Loading.resource
Library   SeleniumLibrary
Library    ../../../Libraries/ExcelLibrary.py
Variables   ../../../Variables/global_config_web.py

*** Keywords ***
Verify Progress Bar
    [Documentation]     Keyword to verify progress bar is displayed in the application
    Wait Until Element Is Visible    ${img_progress_bar}    timeout=${OBJECT_SYNC_MAX_TIMEOUT}
      ...   error=Progress Bar is not displayed in the application
    Log    Progress Bar is displayed in the application

Wait for Progress to Complete
    [Documentation]     Keyword to wait for the progress to get complete
    Wait Until Element Is Not Visible    ${label_loading}   timeout=${INVISIBILITY_MAX_TIMEOUT}
    ...     error=Loading is not completed
    Log    Loading is completed and progress bar is hidden

Verify Finish Message
    [Documentation]     Keyword to verify finish message
    [Arguments]     ${expected_message}
    ${actual_message} =     Get Finish Message
    Should Be Equal As Strings    ${actual_message}    ${expected_message}
    ...     msg=Finish message is not displayed as expected. Expected : ${expected_message}, Actual : ${actual_message}
    Log    Finish message is displayed as expected. Expected : ${expected_message}, Actual : ${actual_message}