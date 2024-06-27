*** Settings ***
Library  JSONLibrary
Library  os
Library  Collections
Library    RequestsLibrary
*** Variables ***
${base_url}  https://restcountries.eu

*** Test Cases ***
Get_countryINfo
  Create Session  mysession  ${base_url}
  ${response}=  Get Request  mysession   /rest/v2/alpha/IN

  ${json_object}=  To Json  ${response.content} 

  #Single date validation 
  ${country_Name}=  Get Value From Json  ${json_object}   $.name
  Log To Console  ${country_Name[0]}
  Should Be Equal  ${country_Name[0]}  India

    #Single date validation 

    ${boarder}=  Get Value From Json  ${json_object}   $.broders[0]
  Log To Console  ${boarder[0]}
  Should Be Equal  ${boarder[0]}  AFG

    #multiple date validation
    ${boarders}=  Get Value From Json  ${json_object}   $.broders
  Log To Console  ${boarders[0]}
  Should Contain Any  ${boarders[0]}  AFG BGD BTN MMR ABC
  Should Not Contain Any  ${boarders[0]}  abc  xyz
