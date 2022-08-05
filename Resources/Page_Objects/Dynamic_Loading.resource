*** Settings ***
Documentation   Page Object file for Dynamic Loading page
Library     SeleniumLibrary

*** Variables ***
${link_example_2} =     link:Example 2: Element rendered after the fact
${button_start} =    xpath://button[text()='Start']
${label_loading} =    id:loading
${img_progress_bar} =   xpath://*[@id='loading']/img
${label_finish_message} =    id:finish

*** Keywords ***
Click Example 2 Link
    [Documentation]     Keyword to click Example 2 Link
    Click Link    ${link_example_2}

Click Start Button
    [Documentation]     Keyword to click Start button
    Click Button    ${button_start}

Get Finish Message
    [Documentation]     Keyword to get finish message
    ${message} =    Get Text    ${label_finish_message}
    [Return]    ${message}