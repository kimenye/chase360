# Chase 360


## Overview

The Base URL is: http://chase360.herokuapp.com/

### Login
    
    The URL is POST {BASE_URL}/verify.json
    
#### Request

    post :verify, { email: "email@www.com" }


#### Response    

    ```
    {
        "user_id": 980190962,
        "user_email": "email@www.com",
        "user_role": "manager",
        "message": "You are logged in",
        "status": "success"
    }
    ```
    
### Request Companies
    

#### Request    
    
    The Url is GET  {BASE_URL}/companies.json
    

#### Response
    
    The response is an array of companies

    ```
    [
        {
            "id": 1,
            "name": "Chase Bank",
            "description": "A cool bank",
            "image_url": "/media/W1siZiIsIjIwMTQvMDYvMTcvMXNpc3g0czM3al9DaGFzZUJhbmtMb2dvLmpwZyJdXQ?sha=bc252c6c",
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
    ]
    ```
    
### Request a Single Company

#### Request
    
    The Url is GET {BASE_URL}/companies/{:id}.json

    E.g http://chase360.herokuapp.com/companies/2.json
    
#### Response

    ```
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
    ```

Submitting a Lead
    
    POST /leads.json

    params { name, email, phone_number, submitted_by_id, message, product_id, branch_id }

    Returns

    id of the lead if there are no validation errors

    { id: 2 }
