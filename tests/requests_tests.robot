*** Settings ***
Documentation     HTTP API tests using RequestsLibrary
Library           RequestsLibrary
Library           Collections
Library           Process
Suite Setup       Start Mock Server
Suite Teardown    Stop Mock Server

*** Variables ***
${SERVER_URL}     http://localhost:8000

*** Keywords ***
Start Mock Server
    ${handle}=    Start Process    python3    ${CURDIR}/mock_server.py
    ...    alias=mock_server    stdout=${TEMPDIR}/server.log    stderr=STDOUT
    Sleep    2s    Wait for server to start
    Set Suite Variable    ${SERVER_HANDLE}    ${handle}

Stop Mock Server
    Terminate Process    ${SERVER_HANDLE}
    Wait For Process    ${SERVER_HANDLE}    timeout=5s

*** Test Cases ***
GET Request Test
    [Documentation]    Tests a simple GET request to mock server
    Create Session    mockserver    ${SERVER_URL}
    ${response}=    GET On Session    mockserver    /test
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Contain    ${response.text}    GET request received
    Delete All Sessions

POST Request Test
    [Documentation]    Tests a POST request with JSON data
    Create Session    mockserver    ${SERVER_URL}
    ${data}=    Create Dictionary    name=Robot    test=framework
    ${response}=    POST On Session    mockserver    /api/data    json=${data}
    Should Be Equal As Numbers    ${response.status_code}    200
    Should Contain    ${response.text}    POST request received
    Delete All Sessions

Request with Custom Headers
    [Documentation]    Tests sending custom headers with request
    Create Session    mockserver    ${SERVER_URL}
    ${headers}=    Create Dictionary    User-Agent=RobotFramework    X-Custom-Header=TestValue
    ${response}=    GET On Session    mockserver    /headers    headers=${headers}
    Should Be Equal As Numbers    ${response.status_code}    200
    Dictionary Should Contain Key    ${response.headers}    Content-Type
    Delete All Sessions

Session Management Test
    [Documentation]    Tests creating and managing multiple sessions
    Create Session    session1    ${SERVER_URL}
    Create Session    session2    ${SERVER_URL}
    ${response1}=    GET On Session    session1    /endpoint1
    ${response2}=    GET On Session    session2    /endpoint2
    Should Be Equal As Numbers    ${response1.status_code}    200
    Should Be Equal As Numbers    ${response2.status_code}    200
    Delete All Sessions
