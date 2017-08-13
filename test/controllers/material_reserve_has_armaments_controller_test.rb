require 'test_helper'

class MaterialReserveHasArmamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_reserve_has_armament = material_reserve_has_armaments(:one)
  end

  test "should get index" do
    get material_reserve_has_armaments_url
    assert_response :success
  end

  test "should get new" do
    get new_material_reserve_has_armament_url
    assert_response :success
  end

  test "should create material_reserve_has_armament" do
    assert_difference('MaterialReserveHasArmament.count') do
      post material_reserve_has_armaments_url, params: { material_reserve_has_armament: { amount: @material_reserve_has_armament.amount, armaments_id: @material_reserve_has_armament.armaments_id, material_reserve_id: @material_reserve_has_armament.material_reserve_id } }
    end

    assert_redirected_to material_reserve_has_armament_url(MaterialReserveHasArmament.last)
  end

  test "should show material_reserve_has_armament" do
    get material_reserve_has_armament_url(@material_reserve_has_armament)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_reserve_has_armament_url(@material_reserve_has_armament)
    assert_response :success
  end

  test "should update material_reserve_has_armament" do
    patch material_reserve_has_armament_url(@material_reserve_has_armament), params: { material_reserve_has_armament: { amount: @material_reserve_has_armament.amount, armaments_id: @material_reserve_has_armament.armaments_id, material_reserve_id: @material_reserve_has_armament.material_reserve_id } }
    assert_redirected_to material_reserve_has_armament_url(@material_reserve_has_armament)
  end

  test "should destroy material_reserve_has_armament" do
    assert_difference('MaterialReserveHasArmament.count', -1) do
      delete material_reserve_has_armament_url(@material_reserve_has_armament)
    end

    assert_redirected_to material_reserve_has_armaments_url
  end
end
