*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  collections

*** Variables ***
${base_url}   http://restapi.demoqa.com
${city}  Delhi
*** Keywords ***
*** Test Cases ***

Get_weatherInfo
    create session  myssion  ${base_url}
    ${response}=   GET  myssion  /utilities/weather/city/${city}

    log to console  ${response.status_code}
    log to console  ${response.content}
    log to console   ${response.headers}

    ${status_code}=  convert to string  ${response.status_code}

    Should Be Equal  ${status_code}  200 

    ${body} =   Convert To String      ${response.content}

    Should Contain  ${body}  Delhi 


    ${contetTypeValue }=   Get   ${response.headers}    content-type
    Should Be Equal  ${contetTypeValue}   application/json