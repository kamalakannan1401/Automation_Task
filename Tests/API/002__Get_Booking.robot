*** Settings ***
Documentation   Suite file for Get Booking API
Resource    ../../Resources/Business_Components/API/Common.resource
Library   RequestsLibrary
Library    Collections
Library     ../../Libraries/ExcelLibrary.py
Test Setup  Test Setup API
Test Teardown   Test Teardown API

*** Test Cases ***
Get Booking With Valid ID
    [Documentation]     Test case to verify get booking API with valid data
    Set Excel File Path    ${data_file_path}
    ${booking_id} =     Get Data From Cell    ${excel_sheet_name}    D2
    ${request_body} =   Get Data    ${excel_sheet_name}    Request_Body
    ${request_body_json_object} =  Convert JSON string To JSON Object    ${request_body}
    ${response} =   GET On Session    alias=${session}     url=/booking/${booking_id}     expected_status=200
    Should Be Equal    ${response.json()}    ${request_body_json_object}
    ...  msg=Booking information is not received as expected.
    Log    Booking information is received as expected. Expected : ${request_body_json_object}, Actual : ${response.json()}
    Log    Received headers - ${response.headers}
    Log    Received response - ${response.text}
    Log    Status Code text - ${response.reason}

Get Booking With Invalid ID
    [Documentation]     Test case to verify get booking API with invalid data
    Set Excel File Path    ${data_file_path}
    ${booking_id} =     Get Data    ${excel_sheet_name}    Booking_ID
    ${response} =   GET On Session    alias=${session}     url=/booking/${booking_id}   expected_status=404
    Should Be Equal As Strings    ${response.text}    Not Found
    ...   msg=Response text is not received as expected.
    Log    Response text is received as expected. Expected : Not Found, Actual : ${response.text}
    Log    Received headers - ${response.headers}
    Log    Received response - ${response.text}
    Log    Status Code text - ${response.reason}