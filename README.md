CHASE360
========

Base URL: http://chase360.herokuapp.com/

Login:

    POST /verify.json

    post :verify, {email: "email@www.com"}

    pass response.body: "{\"user_id\":980190962,\"user_email\":\"email@www.com\",\"user_role\":\"manager\",\"message\":\"You are logged in\",\"status\":\"success\"}"

    fail response.body: “{\"message\":\"Email is invalid\",\"status\":\"unprocessable_entity\"}"
    
Request Companies
    GET  /companies.json
    
    get :index
    
    response.body: [{\"id\":298486374,\"name\":\"company_two\",\"description\":\"This is a description of company one\",\"image_url\":\"http://chase360.herokuapp.com/media/W1siZiIsImZpeHR1cmVfZmlsZV91cGxvYWQoXCIje1JhaWxzLnJvb3R9L3Rlc3QvYXNzZXRzL2ltYWdlcy9JTUcyLmpwZ1wiLCBcImltYWdlL3BuZ1wiKSJdXQ?sha=3dd8717b\"},{\"id\":980190962,\"name\":\"company_one\",\"description\":\"This is a description of company one\",\"image_url\":\"http://chase360.herokuapp.com/media/W1siZiIsImZpeHR1cmVfZmlsZV91cGxvYWQoXCIje1JhaWxzLnJvb3R9L3Rlc3QvYXNzZXRzL2ltYWdlcy9JTUcxLmpwZ1wiLCBcImltYWdlL3BuZ1wiKSJdXQ?sha=01d22041\"}]"
    
Request Products and Companies
    
    GET  /companies/:id.json
    
    get :show, id: company_id
    
    pass response.body: "{\"company_id\":980190962,\"company_name\":\"company_one\",\"categories\":[{\"id\":298486374,\"name\":\"category_two\",\"company_id\":980190962},{\"id\":980190962,\"name\":\"category_one\",\"company_id\":980190962}],\"products\":[[{\"id\":113629430,\"name\":\"product_three\",\"description\":\"This is product three description\",\"category_id\":298486374,\"image_url\":\"http://chase360.herokuapp.com/media/W1siZiIsImZpeHR1cmVfZmlsZV91cGxvYWQoXCIje1JhaWxzLnJvb3R9L3Rlc3QvYXNzZXRzL2ltYWdlcy9JTUcyLmpwZ1wiLCBcImltYWdlL3BuZ1wiKSJdXQ?sha=3dd8717b\"},{\"id\":281110143,\"name\":\"product_four\",\"description\":\"This is product four description\",\"category_id\":298486374,\"image_url\":\"http://chase360.herokuapp.com/media/W1siZiIsImZpeHR1cmVfZmlsZV91cGxvYWQoXCIje1JhaWxzLnJvb3R9L3Rlc3QvYXNzZXRzL2ltYWdlcy9JTUcyLmpwZ1wiLCBcImltYWdlL3BuZ1wiKSJdXQ?sha=3dd8717b\"}],[{\"id\":298486374,\"name\":\"product_two\",\"description\":\"This is product two description\",\"category_id\":980190962,\"image_url\":\"http://chase360.herokuapp.com/media/W1siZiIsImZpeHR1cmVfZmlsZV91cGxvYWQoXCIje1JhaWxzLnJvb3R9L3Rlc3QvYXNzZXRzL2ltYWdlcy9JTUcyLmpwZ1wiLCBcImltYWdlL3BuZ1wiKSJdXQ?sha=3dd8717b\"},{\"id\":980190962,\"name\":\"product_one\",\"description\":\"This is product one description\",\"category_id\":980190962,\"image_url\":\"http://chase360.herokuapp.com/media/W1siZiIsImZpeHR1cmVfZmlsZV91cGxvYWQoXCIje1JhaWxzLnJvb3R9L3Rlc3QvYXNzZXRzL2ltYWdlcy9JTUcyLmpwZ1wiLCBcImltYWdlL3BuZ1wiKSJdXQ?sha=3dd8717b\"}]],\"status\":\"success\"}"

    fail response.body: "{\"message\":\"Company does not exist\",\"status\":\"unprocessable_entity\"}"

Submitting a Lead
    
    POST /leads.json

    params { name, email, phone_number, submitted_by_id, message, product_id, branch_id }

    Returns

    id of the lead if there are no validation errors

    { id: 2 }
