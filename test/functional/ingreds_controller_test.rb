require 'test_helper'

class IngredsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingreds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingred" do
    assert_difference('Ingred.count') do
      post :create, :ingred => { }
    end

    assert_redirected_to ingred_path(assigns(:ingred))
  end

  test "should show ingred" do
    get :show, :id => ingreds(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ingreds(:one).to_param
    assert_response :success
  end

  test "should update ingred" do
    put :update, :id => ingreds(:one).to_param, :ingred => { }
    assert_redirected_to ingred_path(assigns(:ingred))
  end

  test "should destroy ingred" do
    assert_difference('Ingred.count', -1) do
      delete :destroy, :id => ingreds(:one).to_param
    end

    assert_redirected_to ingreds_path
  end
end
