*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  OperatingSystem

*** Variables ***
${base_url}   https://certtransaction.elementexpress.com
${bearerToken}  "Bearer E4F284BFADA11D01A52508ED7B92FFD7EE0905659F5DED06A4B73FC7739B48A287648801"

*** Test Cases ***
BearerAuthTest
   Create Session  mysession  ${base_url}
   ${headers}  Create Dictionary  Authorization=${bearerToken}  Content-Type=text/xml
   ${req_body}  Get File  D:\\QA et Automatisation\\Testing Auto\\robotFramework\\PostData.txt

   ${response}=  Post Request  mysession  /  data=${req_body}  headers=${headers}
   Log To Console  ${response.status_code}
   Log To Console  ${response.content}   