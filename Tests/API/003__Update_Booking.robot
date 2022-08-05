*** Settings ***
Documentation   Suite file for Update Booking API
Resource    ../../Resources/Business_Components/API/Common.resource
Library   RequestsLibrary
Library    Collections
Library     ../../Libraries/ExcelLibrary.py
Test Setup  Test Setup API
Test Teardown   Test Teardown API

*** Test Cases ***
Update Booking
    [Documentation]     Test case to verify update booking API with valid data
    Set Excel File Path    ${data_file_path}
    ${booking_id} =     Get Data From Cell    ${excel_sheet_name}    D2
    ${request_body} =   Get Data    ${excel_sheet_name}    Request_Body
    ${request_headers} =   Get Data    ${excel_sheet_name}    Request_Headers
    ${request_body_json_object} =  Convert JSON String To JSON Object    ${request_body}
    ${request_headers_json_object} =  Convert JSON String To JSON Object    ${request_headers}
    ${response} =   PUT On Session    alias=${session}     url=/booking/${booking_id}     headers=${request_headers_json_object}
    ...     json=${request_body_json_object}    expected_status=200
    Should Be Equal    ${response.json()}    ${request_body_json_object}
    ...     msg=Booking information is not received as expected.
    Log    Booking information is received as expected. Expected : ${request_body_json_object}, Actual : ${response.json()}
    Log    Received headers - ${response.headers}
    Log    Received response - ${response.text}
    Log    Status Code text - ${response.reason}

Update Booking with Partial Data
    [Documentation]     Test case to verify update booking API with partial data
    Set Excel File Path    ${data_file_path}
    ${booking_id} =     Get Data From Cell    ${excel_sheet_name}    D2
    ${request_body} =   Get Data    ${excel_sheet_name}    Request_Body
    ${request_headers} =   Get Data    ${excel_sheet_name}    Request_Headers
    ${request_body_json_object} =  Convert JSON String To JSON Object    ${request_body}
    ${request_headers_json_object} =  Convert JSON String To JSON Object    ${request_headers}
    ${response} =   PUT On Session    alias=${session}     url=/booking/${booking_id}     headers=${request_headers_json_object}
    ...     json=${request_body_json_object}    expected_status=400
    Should Be Equal As Strings    ${response.text}    Bad Request
    ...   msg=Response text is not received as expected.
    Log    Response text is received as expected. Expected : Bad Request, Actual : ${response.text}
    Log    Received headers - ${response.headers}
    Log    Received response - ${response.text}
    Log    Status Code text - ${response.reason}