require "test_helper"

class FinalizeOrderMailerTest < ActionMailer::TestCase
  test "finalize" do
    mail = FinalizeOrderMailer.finalize
    assert_equal "Finalize", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
