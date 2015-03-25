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

    params { name, email, phone_number, submitted_by_id, product_id, branch_id, note }


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

### Feed

You can get a feed of recent activity for a user

#### Request
    
    The URL is GET {BASE_URL}/users/{id}/feed.json

#### Response
    
    Returns a list of recently joined users(members) and leads assigned to that user
     
    {
      "leads" : [],
      "id" : 1,
      "members" : [
        {
          "id" : 2,
          "image_url" : "http://localhost:3000",
          "name" : "Trevor"
        }
      ]
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

### Push Notifications

The following push notifications can be sent from the application

#### Miles Received

This is sent whenever a user performs an action that earns them miles.

##### Title

    ```
        You have been awarded 30 Miles.
    ```

##### Json

    {   
        "reason": "Installing 360 Me",
        "user_id": 3,
        "miles":30,
        "total_miles": 30,
        "notification_type": "MilesAwarded"
    }

#### Lead Assigned

This is sent whenever a user is assigned a lead

##### Title
    
    ```
        You have been assigned a lead.
    ```

##### Json
    
    {
        "reason": "",
        "user_id": 1,
        "lead_id": 1,
        "company_id", 2,
        "product_id", 3,
        "lead_name": "Trevor Kimenye",
        "lead_email": "send@gmail.com",
        "lead_phone_number": "254722200200",
        "created_by_user_id": 2,
        "created_by_user_name": "Super Referer",
        "notification_type": "NewLead"
    } 

