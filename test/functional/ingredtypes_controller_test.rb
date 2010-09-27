require 'test_helper'

class IngredtypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredtypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredtype" do
    assert_difference('Ingredtype.count') do
      post :create, :ingredtype => { }
    end

    assert_redirected_to ingredtype_path(assigns(:ingredtype))
  end

  test "should show ingredtype" do
    get :show, :id => ingredtypes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ingredtypes(:one).to_param
    assert_response :success
  end

  test "should update ingredtype" do
    put :update, :id => ingredtypes(:one).to_param, :ingredtype => { }
    assert_redirected_to ingredtype_path(assigns(:ingredtype))
  end

  test "should destroy ingredtype" do
    assert_difference('Ingredtype.count', -1) do
      delete :destroy, :id => ingredtypes(:one).to_param
    end

    assert_redirected_to ingredtypes_path
  end
end
