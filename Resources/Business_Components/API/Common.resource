*** Settings ***
Documentation   Resource file to hold common keywords related to API tests
Library    RequestsLibrary

*** Variables ***
${base_uri} =   https://restful-booker.herokuapp.com
${data_file_path} =     ${EXECDIR}${/}Data${/}Input_API.xlsx
${excel_sheet_name} =   Data
${session} =    booking_session

*** Keywords ***
Test Setup API
    [Documentation]     Keyword for Test Setup of API tests to create session
    Create Session    alias=${session}    url=${base_uri}   disable_warnings=${True}

Test Teardown API
    [Documentation]     Keyword for Test Teardown of API tests to delete all sessions
    Delete All Sessions

Convert JSON String To JSON Object
    [Documentation]     Keyword to convert JSON string to JSON object
    [Arguments]     ${json_string}
    ${json_object} =   evaluate  json.loads('''${json_string}''')    json
    [Return]  ${json_object}