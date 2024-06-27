*** Settings ***
Library  RequestsLibrary
Library  Collections


*** Variables ***
${base_url}  http://jsonplaceholder.typicode.com

*** Test Cases ***
TestHeaders
   Create Session  mysession  ${base_url}
   ${response}=  Get Request  mysession  /photos

   Log To Console  ${response.headers}

   ${contentTypeValue}=  get from dictionary    ${response.headers}  Content-Type
    Log To Console    Content-Type: ${contentTypeValue}
   Should Be Equal   ${contentTypeValue}  application/json; charset=utf-8

    ${contentTypeValue}=  Get From Dictionary    ${response.headers}  Content-Encoding 
   Log To Console    Content-Encoding: ${contentTypeValue} 
   Should Be Equal   ${contentTypeValue}  gzip

TestCookies
    Create Session  mysession  ${base_url}
   ${response}=  Get Request  mysession  /photos
  
   Log To Console  ${response.cookies}  #Displayes all the cookies from response

    # ${cookiesValue}=  Get From Dictionary  ${response.cookies}  _cfduid
    # Log To Console  ${cookiesValue}  #Display specific cookie value"