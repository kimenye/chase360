CHASE360
========

Base URL: http://chase360.herokuapp.com/

Login:

    POST /verify.json

    post :verify, {email: "email@www.com"}

    pass response.body: "{\"user_id\":980190962,\"user_email\":\"email@www.com\",\"user_role\":\"manager\",\"message\":\"You are logged in\",\"status\":\"success\"}"

    fail response.body: “{\"message\":\"Email is invalid\",\"status\":\"unprocessable_entity\"}"
    
Request Products and Companies
    
    GET  /companies/:company_name.json
    
    get :show, company_name: "company_one"
    
    pass response.body: ""{\"company_name\":\"company_one\",\"categories\":[{\"id\":298486374,\"name\":\"category_two\",\"company_id\":980190962,\"created_at\":\"2014-05-08T19:19:01.000Z\",\"updated_at\":\"2014-05-08T19:19:01.000Z\"},{\"id\":980190962,\"name\":\"category_one\",\"company_id\":980190962,\"created_at\":\"2014-05-08T19:19:01.000Z\",\"updated_at\":\"2014-05-08T19:19:01.000Z\"}],\"products\":[[{\"id\":113629430,\"name\":\"product_three\",\"category_id\":298486374,\"created_at\":\"2014-05-08T19:19:01.000Z\",\"updated_at\":\"2014-05-08T19:19:01.000Z\"},{\"id\":281110143,\"name\":\"product_four\",\"category_id\":298486374,\"created_at\":\"2014-05-08T19:19:01.000Z\",\"updated_at\":\"2014-05-08T19:19:01.000Z\"}],[{\"id\":298486374,\"name\":\"product_two\",\"category_id\":980190962,\"created_at\":\"2014-05-08T19:19:01.000Z\",\"updated_at\":\"2014-05-08T19:19:01.000Z\"},{\"id\":980190962,\"name\":\"product_one\",\"category_id\":980190962,\"created_at\":\"2014-05-08T19:19:01.000Z\",\"updated_at\":\"2014-05-08T19:19:01.000Z\"}]],\"status\":\"success\"}"

    fail response.body: "{\"message\":\"Company does not exist\",\"status\":\"unprocessable_entity\"}"
