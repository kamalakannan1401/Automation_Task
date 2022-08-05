*** Settings ***
Documentation   Suite file for web test cases
Resource    ../../Resources/Business_Components/Web/Common.resource
Resource    ../../Resources/Business_Components/Web/Home.resource
Resource    ../../Resources/Business_Components/Web/Login.resource
Resource    ../../Resources/Business_Components/Web/Dynamic_Loading.resource
Resource    ../../Resources/Business_Components/Web/Windows.resource
Resource    ../../Resources/Business_Components/Web/Drag_and_Drop.resource
Resource    ../../Resources/Business_Components/Web/Frames.resource
Resource    ../../Resources/Business_Components/Web/Javascript_Alerts.resource
Library     ../../Libraries/ExcelLibrary.py
Test Setup  Test Setup Web
Test Teardown   Test Teardown Web

*** Variables ***
${data_file_path} =     ${EXECDIR}${/}Data${/}Input_Web.xlsx
${excel_sheet_name} =   Data

*** Test Cases ***
#TestCase-1
Login
    [Documentation]     Test case to verify valid and invalid login
#    Step 1
    Navigate to App Url
    Navigate to Form Authentication
#    Step 2
    ${username}     ${password} =   Get Username and Password from Login Info
    Set Excel File Path    ${data_file_path}
    Put Data    ${excel_sheet_name}    Username_1    ${username}
    Put Data    ${excel_sheet_name}    Password_1    ${password}
#    Step 3
    ${username} =   Get Data    ${excel_sheet_name}    Username_1
    ${password} =   Get Data    ${excel_sheet_name}    Password_1
    Login    ${username}    ${password}
#    Step 4
    ${expected_message} =   Get Data    ${excel_sheet_name}    Valid_Login_Message
    Verify Valid Login    ${expected_message}
    Logout
#    Step 5
    ${username} =   Get Data    ${excel_sheet_name}    Username_2
    ${password} =   Get Data    ${excel_sheet_name}    Password_2
    Login    ${username}    ${password}
    ${expected_message} =   Get Data    ${excel_sheet_name}    Invalid_Login_Message
    Verify Invalid Credentials    ${expected_message}
    ${username} =   Get Data    ${excel_sheet_name}    Username_3
    ${password} =   Get Data    ${excel_sheet_name}    Password_3
    Login    ${username}    ${password}
    ${expected_message} =   Get Data    ${excel_sheet_name}    Invalid_Password_Message
    Verify Invalid Credentials    ${expected_message}

#TestCase-2
Dynamic Loading
    [Documentation]     Test case to verify dynamic loading
#    Step 1
    Navigate to App Url
    Set Excel File Path    ${data_file_path}
    Navigate to Dynamic Loading
    Click Example 2 Link
#    Step 2
    Click Start Button
#    Step 3
    Verify Progress Bar
#    Step 4
    Wait for Progress to Complete
    ${expected_message} =   Get Data    ${excel_sheet_name}    Finish_Message
    Verify Finish Message    ${expected_message}
    Capture Page Screenshot

#TestCase-3
Multiple Windows
    [Documentation]     Test case to verify multiple windows
#    Step 1
    Navigate to App Url
    Navigate to Multiple Windows
#    Step 2
    Click Link Click Here
#    Step 3
    Switch Window and Log Url
#    Step 4
    Close Window
#    Step 5
    Switch Window and Log Title

#TestCase-4
Drag and Drop
    [Documentation]     Test case to verify Drag and Drop
#    Step 1
    Navigate to App Url
    Navigate to Drag and Drop
#    Step 2
    Drag and Drop Column A to Column B
#    Step 3
    Verify Drop
#    Step 4
    Capture Page Screenshot

#TestCase-5
IFrames
    [Documentation]     Test case to verify IFrames
#    Step 1
    Navigate to App Url
    Navigate to Frames
    Click Link IFrame
#    Step 2
    Switch to Content Area Frame
    Set Excel File Path    ${data_file_path}
    ${content_area_text} =   Get Data    ${excel_sheet_name}    Content_Area_Text
    Set Content Area Text    ${content_area_text}
#    Step 3
    Apply Bold to Content Area Text
#    Step 4
    Capture Page Screenshot

#TestCase-6
JavaScript Alerts
    [Documentation]     Test case to verify Javascript Alerts
#    Step 1
    Navigate to App Url
    Set Excel File Path    ${data_file_path}
    Navigate to Javascript Alerts
#    Step 2
    Click JS Confirm Button
#    Step 3
    Handle Alert    action=DISMISS  timeout=${OBJECT_SYNC_MAX_TIMEOUT}
#    Step 4
    ${expected_message} =   Get Data    ${excel_sheet_name}    Cancel_Message
    Verify Cancelled Message    ${expected_message}
    Capture Page Screenshot