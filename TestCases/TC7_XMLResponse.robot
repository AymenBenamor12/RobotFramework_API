*** Settings ***
Library  XML
Library  os
Library  collections
Library  RequestsLibrary
*** Variables ***
${Base_URL}  http://thomas-bayer.com
*** Test Cases ***

TestCase1
  Create Session  mysession  ${Base_URL}
  ${response}=  Get Request  mysession  /sqlrest/CUSTOMER/15
  ${xml_string}=  Convert To String  ${response.content}
  ${xml_obj}=  Parse Xml  ${xml_string}

 #Check Single element value
  Element Text Should Be   ${xml_obj}  15  .//ID  

 #Check Multiple Values 
   ${child_elements}=  Get Child Elements  ${xml_obj} 
   Should Not Be Empty  ${child_elements}
   ${id}=  Get Element Text   ${child_elements[0]}
   ${fname}=  Get Element Text  ${child_Elements[1]}
   ${Lname}=  Get Element Text  ${child_Elements[2]}
   ${streat}=  Get Element Text  ${child_Elements[3]}
    ${city}=  Get Element Text  ${child_Elements[4]}

    Should Be Equal  ${id}  15
    Should Be Equal  ${fname}  Bill
    Should Be Equal  ${Lname}  Clancy
    Should Be Equal  ${streat}  319 Upland PL.
    Should Be Equal  ${city}  Seattle 
