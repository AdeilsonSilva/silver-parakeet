require 'test_helper'

class MaterialReserveHasAccessoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_reserve_has_accessory = material_reserve_has_accessories(:one)
  end

  test "should get index" do
    get material_reserve_has_accessories_url
    assert_response :success
  end

  test "should get new" do
    get new_material_reserve_has_accessory_url
    assert_response :success
  end

  test "should create material_reserve_has_accessory" do
    assert_difference('MaterialReserveHasAccessory.count') do
      post material_reserve_has_accessories_url, params: { material_reserve_has_accessory: { accessories_id: @material_reserve_has_accessory.accessories_id, amount: @material_reserve_has_accessory.amount, material_reserve_id: @material_reserve_has_accessory.material_reserve_id } }
    end

    assert_redirected_to material_reserve_has_accessory_url(MaterialReserveHasAccessory.last)
  end

  test "should show material_reserve_has_accessory" do
    get material_reserve_has_accessory_url(@material_reserve_has_accessory)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_reserve_has_accessory_url(@material_reserve_has_accessory)
    assert_response :success
  end

  test "should update material_reserve_has_accessory" do
    patch material_reserve_has_accessory_url(@material_reserve_has_accessory), params: { material_reserve_has_accessory: { accessories_id: @material_reserve_has_accessory.accessories_id, amount: @material_reserve_has_accessory.amount, material_reserve_id: @material_reserve_has_accessory.material_reserve_id } }
    assert_redirected_to material_reserve_has_accessory_url(@material_reserve_has_accessory)
  end

  test "should destroy material_reserve_has_accessory" do
    assert_difference('MaterialReserveHasAccessory.count', -1) do
      delete material_reserve_has_accessory_url(@material_reserve_has_accessory)
    end

    assert_redirected_to material_reserve_has_accessories_url
  end
end
