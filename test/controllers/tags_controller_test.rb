require 'test_helper'

class TagsControllerTest < ActionController::TestCase
  setup do
    @tag = tags(:first_tag)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag
    assert_response :success
  end

  test "should update tag" do
    patch :update, id: @tag, tag: { name: 'Updated tag' }
    assert_redirected_to tags_path
  end

  test "should destroy tag" do
    assert_difference('Tag.count', -1) do
      delete :destroy, id: @tag
    end

    assert_redirected_to tags_path
  end
end
