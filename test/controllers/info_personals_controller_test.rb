require 'test_helper'

class InfoPersonalsControllerTest < ActionController::TestCase
  setup do
    @info_personal = info_personals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:info_personals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create info_personal" do
    assert_difference('InfoPersonal.count') do
      post :create, info_personal: { cpf: @info_personal.cpf, email: @info_personal.email, nome: @info_personal.nome, rg: @info_personal.rg }
    end

    assert_redirected_to info_personal_path(assigns(:info_personal))
  end

  test "should show info_personal" do
    get :show, id: @info_personal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @info_personal
    assert_response :success
  end

  test "should update info_personal" do
    patch :update, id: @info_personal, info_personal: { cpf: @info_personal.cpf, email: @info_personal.email, nome: @info_personal.nome, rg: @info_personal.rg }
    assert_redirected_to info_personal_path(assigns(:info_personal))
  end

  test "should destroy info_personal" do
    assert_difference('InfoPersonal.count', -1) do
      delete :destroy, id: @info_personal
    end

    assert_redirected_to info_personals_path
  end
end
