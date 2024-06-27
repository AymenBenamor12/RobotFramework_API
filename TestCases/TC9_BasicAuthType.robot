*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}  http://restapi.demoqa.com

*** Test Cases ***
BasicAuthTest
  ${auth}=  Create List  ToolsQA  TestPassword
  Create Session  myssion  ${base_url}  auth=${auth}
  ${response}  Get Request  myssion  /authentication/CheckForAuthentication/
  Log To Console  ${response.content}

  Should Be Equal As Strings  ${response.status_code}  200

