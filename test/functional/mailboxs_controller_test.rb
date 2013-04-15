require 'test_helper'
#test mailbox controller
class MailboxsControllerTest < ActionController::TestCase
  test "should get inbox" do
    get :inbox
    assert_response :success
  end

  test "should get sent" do
    get :sent
    assert_response :success
  end

  test "should get trash" do
    get :trash
    assert_response :success
  end

end
