*** Settings ***

Library  RequestsLibrary
Library  collections

*** Variables ***

${base_url} =  http://restapi.demoqa.com/customer


*** Test Cases ***

Put_Customerregistration   
   create session  mysession  ${base_url}
   ${body}=  Create Dictionary  Firstname=EWR  Lastname=EWEW  UserName=WEWE  password=WEWE  Email=WAWe@gamil.com
   ${header}=  Create Dictionary  Content-Type=application/json
   
   ${response}=  Post Request   mysession  /register data=${body}  headers=${header}

   Log To Console    ${response.status_code} 
   Log To Console    ${response.content}
  #VALIDATIONS
    
    ${status_code}=  Convert To String  ${response.status_code}
     should be equal   ${status_code}   201

    ${res_body}=  Convert To String  ${response.content}
    Should Contain  ${res_body}  OPERATION_SUCCES
    Should Contain  ${res_body}  Operation completed successfully
