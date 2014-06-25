require "test_helper"

class LeadMailerTest < ActionMailer::TestCase
  # def test_assigned_notification
  # 	c=Company.create! name: "Chase"
  # 	p = Product.create! name: "product", company_id: c.id
  # 	company = p.company
  # 	user = User.where(company_id: company.id, role_id: Role.find_by(name: "Relationship Officer").id).sample
  # 	Lead.create! name: "Muaad", email: "adfgsf@sgsg.vgd", phone_number: "034656", submitted_by_id: user.id, status: "New", product_id: p.id
  #   mail = LeadMailer.assigned_notification(user, lead)
  #   assert_equal "Assigned notification", mail.subject
  #   assert_equal ["to@example.org"], mail.to
  #   assert_equal ["from@example.com"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end

end
