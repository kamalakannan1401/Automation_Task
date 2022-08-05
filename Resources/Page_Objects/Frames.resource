*** Settings ***
Documentation   Page Object file for Frames page
Library     SeleniumLibrary
Variables   ../../Variables/global_config_web.py

*** Variables ***
${link_iframe} =     link:iFrame
${iframe_rich_text_area} =  xpath://iframe[@title='Rich Text Area']
${content_area} =   xpath://*[contains(@class,'content-body')]
${button_bold} =    xpath://button[@title='Bold']
${content_area_bold_text} =     xpath://*[contains(@class,'content-body')]//strong

*** Keywords ***
Click Link IFrame
    [Documentation]     Keyword to click iframe link
    Click Link    ${link_iframe}

Switch to Content Area Frame
    [Documentation]     Keyword to switch to content area frame
    Select Frame    ${iframe_rich_text_area}

Set Content Area Text
    [Documentation]     Keyword to enter text in the content area
    [Arguments]     ${text}
    Click Element    ${content_area}
    Clear Element Text    ${content_area}
    Wait Until Keyword Succeeds    ${OBJECT_SYNC_AVG_TIMEOUT}
        ...     1    Element Text Should Be    ${content_area}    ${EMPTY}
    Input Text    ${content_area}    ${text}    clear=${False}

Click Bold Button
    [Documentation]     Keyword to click Bold button in content area
    Click Button    ${button_bold}