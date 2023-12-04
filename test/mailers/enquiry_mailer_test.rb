require "test_helper"

class EnquiryMailerTest < ActionMailer::TestCase
  test "thanks" do
    mail = EnquiryMailer.thanks
    assert_equal "Thanks", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
