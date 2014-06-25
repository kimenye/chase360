require "test_helper"

class LeadMailerTest < ActionMailer::TestCase
  def test_assigned_notification
    mail = LeadMailer.assigned_notification
    assert_equal "Assigned notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
