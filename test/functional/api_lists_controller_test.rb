require 'test_helper'

class ApiListsControllerTest < ActionController::TestCase
  setup do
    @api_list = api_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_list" do
    assert_difference('ApiList.count') do
      post :create, :api_list => @api_list.attributes
    end

    assert_redirected_to api_list_path(assigns(:api_list))
  end

  test "should show api_list" do
    get :show, :id => @api_list.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @api_list.to_param
    assert_response :success
  end

  test "should update api_list" do
    put :update, :id => @api_list.to_param, :api_list => @api_list.attributes
    assert_redirected_to api_list_path(assigns(:api_list))
  end

  test "should destroy api_list" do
    assert_difference('ApiList.count', -1) do
      delete :destroy, :id => @api_list.to_param
    end

    assert_redirected_to api_lists_path
  end
end
