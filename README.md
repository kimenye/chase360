CHASE360
========

Base URL: 

Login:

    POST /verify.json

    post :create, {email: "email@www.com"}

    response.body: "{\"user_id\":980190962,\"message\":\"You are logged in\",\"status\":\"success\"}"

    response.body: “{\"message\":\"Email is invalid\",\"status\":\"unprocessable_entity\"}"