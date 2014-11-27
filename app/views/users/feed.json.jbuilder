json.extract! @user, :id
json.members @new_users, :id, :name, :image_url
json.leads @assigned_leads, :id, :name, :phone_number

