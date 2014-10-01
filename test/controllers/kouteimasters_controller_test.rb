require 'test_helper'

class KouteimastersControllerTest < ActionController::TestCase
  setup do
    @kouteimaster = kouteimasters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kouteimasters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kouteimaster" do
    assert_difference('Kouteimaster.count') do
      post :create, kouteimaster: { kouteicode: @kouteimaster.kouteicode, kouteiname: @kouteimaster.kouteiname }
    end

    assert_redirected_to kouteimaster_path(assigns(:kouteimaster))
  end

  test "should show kouteimaster" do
    get :show, id: @kouteimaster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kouteimaster
    assert_response :success
  end

  test "should update kouteimaster" do
    patch :update, id: @kouteimaster, kouteimaster: { kouteicode: @kouteimaster.kouteicode, kouteiname: @kouteimaster.kouteiname }
    assert_redirected_to kouteimaster_path(assigns(:kouteimaster))
  end

  test "should destroy kouteimaster" do
    assert_difference('Kouteimaster.count', -1) do
      delete :destroy, id: @kouteimaster
    end

    assert_redirected_to kouteimasters_path
  end
end
