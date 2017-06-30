# VideoKen-server  

Rails API to support creation of patients, physicians and appointments between them.

# Endpoints  

## User Creation  

POST: /api/v1/users  
params: name(string), email(string), number(string), role(string in ['patient', 'physician']), specialization(:string)

## User Listings

GET: /api/v1/patients  
GET: /api/v1/physicians  

## Appointment Creation  

POST: /api/v1/appointments  
params: patient_id(integer), physician_id(integer), diseases(string)

## Appointments Listing

GET: /api/v1/appointments  

# Client Hosting  

The demo web app consuming this API is hosted at : https://thawing-eyrie-25010.herokuapp.com/.




