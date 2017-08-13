require 'test_helper'

class MaterialReserveHasAmmunitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_reserve_has_ammunition = material_reserve_has_ammunitions(:one)
  end

  test "should get index" do
    get material_reserve_has_ammunitions_url
    assert_response :success
  end

  test "should get new" do
    get new_material_reserve_has_ammunition_url
    assert_response :success
  end

  test "should create material_reserve_has_ammunition" do
    assert_difference('MaterialReserveHasAmmunition.count') do
      post material_reserve_has_ammunitions_url, params: { material_reserve_has_ammunition: { ammunition_id: @material_reserve_has_ammunition.ammunition_id, amount: @material_reserve_has_ammunition.amount, material_reserve_id: @material_reserve_has_ammunition.material_reserve_id } }
    end

    assert_redirected_to material_reserve_has_ammunition_url(MaterialReserveHasAmmunition.last)
  end

  test "should show material_reserve_has_ammunition" do
    get material_reserve_has_ammunition_url(@material_reserve_has_ammunition)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_reserve_has_ammunition_url(@material_reserve_has_ammunition)
    assert_response :success
  end

  test "should update material_reserve_has_ammunition" do
    patch material_reserve_has_ammunition_url(@material_reserve_has_ammunition), params: { material_reserve_has_ammunition: { ammunition_id: @material_reserve_has_ammunition.ammunition_id, amount: @material_reserve_has_ammunition.amount, material_reserve_id: @material_reserve_has_ammunition.material_reserve_id } }
    assert_redirected_to material_reserve_has_ammunition_url(@material_reserve_has_ammunition)
  end

  test "should destroy material_reserve_has_ammunition" do
    assert_difference('MaterialReserveHasAmmunition.count', -1) do
      delete material_reserve_has_ammunition_url(@material_reserve_has_ammunition)
    end

    assert_redirected_to material_reserve_has_ammunitions_url
  end
end
