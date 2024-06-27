*** Settings ***
Library  RequestsLibrary
Library  Collections

*** Variables *** 
${base_URL}  https://maps.googleapis.com
${req_url}  /maps/api/place/nearbysearch/xml?


*** Test Cases *** 
GoogleMapPlacesAPITC
  Create Session  mysession  ${base_URL}
  ${params}  Create Dictionary  location=-33.8670522,151.1957362  radius=500  types=food  name=harbour  key=AIzaSyDcb1GvPUeXMMJrcj1y_3JffH6LkS0ittU
  ${response}=  Get Request  mysession  ${req_url}  params=${params}
  
  Log To Console  ${response.status_code}
    Log To Console  ${response.content}