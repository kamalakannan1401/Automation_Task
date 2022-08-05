*** Settings ***
Documentation   Resource file hold keywords related to Frames functionality
Resource    ../../Page_Objects/Frames.resource
Library   SeleniumLibrary
Variables   ../../../Variables/global_config_web.py

*** Keywords ***
Apply Bold to Content Area Text
    [Documentation]     Keyword to apply Bold to Content Area Text
    Click Element    ${content_area}
    Press Keys  ${content_area}     CTRL+a
    Unselect Frame
    Click Bold Button
    Switch to Content Area Frame
    Click Element    ${content_area}
    Wait Until Element Is Visible    ${content_area_bold_text}  timeout=${OBJECT_SYNC_MIN_TIMEOUT}
      ...   error=Bold text is not displayed
    Log    Text with Bold formatting is displayed
    Unselect Frame