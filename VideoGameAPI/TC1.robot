*** Settings ***
Library  RequestsLibrary
Library  collections

*** Variables ***

${base_url}   http://localhost:8080

*** Test Cases ***
TC1:Returns all the videos games(GET)
  Create Session  mysession  ${base_url}
  ${response}=  Get Request  mysession   /app/videogames
  Log To Console  ${response.status_code}
  Log To Console  ${response.content}

  #Validation
    ${status_code}  Convert To String  ${response.status_code}
    Should Be Equal  ${status_code}  200

TC2:Returns all the videos games(POST)    
  Create Session  mysession  ${base_url}
  ${body}=  Create Dictionary  id=100  name=Spider-Man  
  ${header}=  Create Dictionary  content-Type=appication/json
  ${response}=  post request  mysession  /app/videogames  date=${body}  headers=${header}
  Log To Console     ${response.status_code}
  Log To Console  ${response.content}

  #Validation
    ${status_code}  Convert To String  ${response.status_code}
    Should Be Equal  ${status_code}  200

    ${res_body}=  Convert To String  ${response.content}
    should contain  ${res_body}  Record Added Successfully

TC3:Returns the details of a single game by ID(GET)
  Create Session  mysession  ${base_url}
  ${response}=  Get Request  mysession   /app/videogames/100
  Log To Console  ${response.status_code}
  Log To Console  ${response.content}

  #Validation
    ${status_code}  Convert To String  ${response.status_code}
    Should Be Equal  ${status_code}  200
   ${re_body}=  convert to string  ${response.content}
   Should Contain   ${re_body}  Spider_Man  #Name of game


TC4:Update an existing video game by specifying a new body (PUT)    
  Create Session  mysession  ${base_url}
  ${body}=  Create Dictionary  id=100  name=Pac-Man  
  ${header}=  Create Dictionary  content-Type=appication/json
  ${response}=  post request  mysession  /app/videogames  date=${body}  headers=${header}
  Log To Console     ${response.status_code}
  Log To Console  ${response.content}

  #Validation
    ${status_code}  Convert To String  ${response.status_code}
    Should Be Equal  ${status_code}  200

    ${res_body}=  Convert To String  ${response.content}
    should contain  ${res_body}  Pacman

TC5: Deletes a vidoe game by ID (DELETE)
   Create Session  mysession  ${base_url}
  ${response}  Delete Request  mysession  /app/videogames/100

  #validation 
  ${status_code}=  Convert To String  ${response.status_code}
  Should Be Equal  ${status_code}  200

  ${res_body}=  Convert To String  ${response.content}
  Should Contain  ${res_body}  Record Deleted Successfully