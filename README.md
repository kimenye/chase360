# Chase 360


## Overview

The Base URL is: http://chase360.herokuapp.com/

### Login
    
    The URL is POST {BASE_URL}/verify.json
    
#### Request

    post :verify, { email: "email@www.com" }


#### Response    

    
    {
        "user_id": 980190962,
        "user_email": "email@www.com",
        "user_role": "manager",
        "message": "You are logged in",
        "status": "success"
        "setup": true
    }
    
    

### Setting up a Profile

    The URL is POST {BASE_URL}/users/{:id}.json

#### Request
    
    post { name: "Trevor Kimenye", company_id: 1, phone_number: "254722876889", department_id: 1, id: 1, image: "" }

#### Response

    {
        "id" : 980190962,
        "status" : "success"
    }

### Request Companies
    

#### Request    
    
    The Url is GET  {BASE_URL}/companies.json
    

#### Response
    
    The response is an array of companies

    
    [
        {
            "id": 1,
            "name": "Chase Bank",
            "description": "A cool bank",
            "image_url": "/media/W1siZiIsIjIwMTQvMDYvMTcvMXNpc3",
            "branches": [
                {
                    "id": 2,
                    "name": "Wabera Street, Nairobi"
                }
            ],
            "products": [
                {
                    "id": 1,
                    "name": "Savings account",
                    "description": "This is a simple savings account from chase bank",
                    "image_url": ""
                }
            ],
            "departments" : [
                {
                    "id" : 1,
                    "name" : "Unit Trust"
                }
            ]
        }
    ]
    
    
### Requesting a Single Company

#### Request
    
    The Url is GET {BASE_URL}/companies/{:id}.json

    E.g http://chase360.herokuapp.com/companies/2.json
    
#### Response


    {
        "id": 1,
        "name": "Chase Bank",
        "branches": [
            {
                "id": 2,
                "name": "Wabera Street, Nairobi"
            }
        ],
        "products": [
            {
                "id": 1,
                "name": "Savings account",
                "description": "This is a simple savings account from chase bank",
                "image_url": ""
            }
        ]
    }
    
### Departments

#### Request
    
    The Url is GET {BASE_URL}/departments.json

#### Response


### Submitting a Lead
    
#### Request    
    
    The Url is POST {BASE_URL}/leads.json

    params { name, email, phone_number, submitted_by_id, message, product_id, branch_id }


#### Response

    {
        "id": 1
    }


### Closing a lead

#### Request    
    
    The Url is POST {BASE_URL}/leads.json

    params { id }

#### Response

    {
        "id": 1
    }

### Retrieving Leads

You can get a listing of all the leads currently saved

#### Request
    
    The URL is GET {BASE_URL}/leads.json

    params { submitted_by_id }

#### Response
    
    Depending on whether you have specifed a submitted_by_id you will get an array of all the leads in json

    [
        {
            "id" : 1,
            "product_id" : 1,
            "branch_id": 1,
            "submitted_by_id" : 1,
            "status" : "New",
            "email" : "user@domain.com",
            "phone_number" : "2541234567890"
        }
    ]
