*** Settings ***
Library  JSONLibrary
Library  os
Library  collections
Library    String

*** Test Cases ***
Testcase1 :
  
   ${json_obj}=  Load Json From File      file_name=D:\\QA et Automatisation\\Testing Auto\\robotFramework\\jsondata.json
   ${name_value}=  Get Value From Json   ${json_obj}   $.firstName
   Should Be Equal  ${name_value[0]}  John


TestCase2: 
#    Strip String :
#   Strip String est une fonction intégrée de Robot Framework qui supprime les espaces blancs en début et en fin de chaîne.
#   Cette fonction fait partie de la bibliothèque BuiltIn, qui est automatiquement importée par Robot Framework.
  
   ${json_obj}=  Load Json From File      file_name=D:\\QA et Automatisation\\Testing Auto\\robotFramework\\jsondata.json
   ${street_value}=  Get Value From Json   ${json_obj}  $.address.streetAdress
   ${street_value_trimmed}=  Strip String   ${street_value[0]}
   Should Be Equal    ${street_value_trimmed}    21 2nd Street

TestCase3 :
     ${json_obj}=  Load Json From File      file_name=D:\\QA et Automatisation\\Testing Auto\\robotFramework\\jsondata.json
     ${faxnumber_value}=  Get Value From Json   ${json_obj}  $.phoneNumber[1].number
     ${faxnumber_value_trimmed}=  Strip String   ${faxnumber_value[0]}
     Should Be Equal  ${faxnumber_value_trimmed}   646 555-4567