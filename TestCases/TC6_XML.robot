*** Settings ***
Library  XML
Library  os
Library  collections

*** Test Cases ***

TestCase1
   [Documentation]    Example test case to parse XML
   ${xml_obj}=   Parse Xml     D:\\QA et Automatisation\\Testing Auto\\robotFramework\\employees.xml
   Log    ${xml_obj}
  #validatons

  #val1 -Check the Single Element value
  #Appraoch1
TestCase2
   ${xml_obj}=   Parse Xml     D:\\QA et Automatisation\\Testing Auto\\robotFramework\\employees.xml  
  ${emp_firstname}=  Get Element Text  ${xml_obj}  .//employee[1]/firstname
  Should Be Equal  ${emp_firstname}  John
 
TestCase3
   ${xml_obj}=   Parse Xml     D:\\QA et Automatisation\\Testing Auto\\robotFramework\\employees.xml 
  #Appraoch2
  ${emp_firstname}=  Get Element  ${xml_obj}   .//employee[1]/firstname
  Should Be Equal   ${emp_firstname.text}  John

 #Appraoch3
TestCase4
   ${xml_obj}=   Parse Xml     D:\\QA et Automatisation\\Testing Auto\\robotFramework\\employees.xml 
   Element Text Should Be  ${xml_obj}  John   .//employee[1]/firstname

  #val2 -Check Number of Element 
TestCase5
   ${xml_obj}=   Parse Xml     D:\\QA et Automatisation\\Testing Auto\\robotFramework\\employees.xml  
  ${count}=  Get Element Count  ${xml_obj}  .//employee
  Should Be Equal As Integers  ${count}  6


#val3 -Check attribute presence

TestCase6
   ${xml_obj}=   Parse Xml     D:\\QA et Automatisation\\Testing Auto\\robotFramework\\employees.xml
   Element Attribute Should Be   ${xml_obj}  id   be129   .//employee[1]
   Element Attribute Should Be   ${xml_obj}  id   be135   .//employee[6]

#val4 -Check Value of child elements
TestCase7
   ${xml_obj}=   Parse Xml     D:\\QA et Automatisation\\Testing Auto\\robotFramework\\employees.xml

   ${child_Elements}=  Get Child Elements  ${xml_obj}  .//employee[1]
    Should Not Be Empty  ${child_Elements}

    ${fname}=  Get Element Text  ${child_Elements[0]}
    ${Lname}=  Get Element Text  ${child_Elements[1]}
    ${Title}=  Get Element Text  ${child_Elements[2]}


    Log To Console  ${fname}
    Log To Console  ${Lname}
    Log To Console  ${Title}

    Should Be Equal  ${fname}  John
    Should Be Equal  ${Lname}  Doe
    Should Be Equal  ${Title}  Engineer 