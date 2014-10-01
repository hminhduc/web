require 'test_helper'

class TantoshasControllerTest < ActionController::TestCase
  setup do
    @tantosha = tantoshas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tantoshas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tantosha" do
    assert_difference('Tantosha.count') do
      post :create, tantosha: { tanto_code: @tantosha.tanto_code, tanto_name: @tantosha.tanto_name, tanto_password: @tantosha.tanto_password }
    end

    assert_redirected_to tantosha_path(assigns(:tantosha))
  end

  test "should show tantosha" do
    get :show, id: @tantosha
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tantosha
    assert_response :success
  end

  test "should update tantosha" do
    patch :update, id: @tantosha, tantosha: { tanto_code: @tantosha.tanto_code, tanto_name: @tantosha.tanto_name, tanto_password: @tantosha.tanto_password }
    assert_redirected_to tantosha_path(assigns(:tantosha))
  end

  test "should destroy tantosha" do
    assert_difference('Tantosha.count', -1) do
      delete :destroy, id: @tantosha
    end

    assert_redirected_to tantoshas_path
  end
end
