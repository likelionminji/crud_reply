require 'test_helper'

class CommentControllerTest < ActionController::TestCase
  test "should get reply_create" do
    get :reply_create
    assert_response :success
  end

  test "should get reply_delete" do
    get :reply_delete
    assert_response :success
  end

end
