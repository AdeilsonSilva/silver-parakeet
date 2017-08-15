require 'test_helper'

class MaterialReservesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_reserve = material_reserves(:one)
  end

  test "should get index" do
    get material_reserves_url
    assert_response :success
  end

  test "should get new" do
    get new_material_reserve_url
    assert_response :success
  end

  test "should create material_reserve" do
    assert_difference('MaterialReserve.count') do
      post material_reserves_url, params: { material_reserve: { reserve_id: @material_reserve.reserve_id } }
    end

    assert_redirected_to material_reserve_url(MaterialReserve.last)
  end

  test "should show material_reserve" do
    get material_reserve_url(@material_reserve)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_reserve_url(@material_reserve)
    assert_response :success
  end

  test "should update material_reserve" do
    patch material_reserve_url(@material_reserve), params: { material_reserve: { reserve_id: @material_reserve.reserve_id } }
    assert_redirected_to material_reserve_url(@material_reserve)
  end

  test "should destroy material_reserve" do
    assert_difference('MaterialReserve.count', -1) do
      delete material_reserve_url(@material_reserve)
    end

    assert_redirected_to material_reserves_url
  end
end
