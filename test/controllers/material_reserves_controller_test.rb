require 'test_helper'

class MaterialReservesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_reserf = material_reserves(:one)
  end

  test "should get index" do
    get material_reserves_url
    assert_response :success
  end

  test "should get new" do
    get new_material_reserf_url
    assert_response :success
  end

  test "should create material_reserf" do
    assert_difference('MaterialReserve.count') do
      post material_reserves_url, params: { material_reserf: {  } }
    end

    assert_redirected_to material_reserf_url(MaterialReserve.last)
  end

  test "should show material_reserf" do
    get material_reserf_url(@material_reserf)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_reserf_url(@material_reserf)
    assert_response :success
  end

  test "should update material_reserf" do
    patch material_reserf_url(@material_reserf), params: { material_reserf: {  } }
    assert_redirected_to material_reserf_url(@material_reserf)
  end

  test "should destroy material_reserf" do
    assert_difference('MaterialReserve.count', -1) do
      delete material_reserf_url(@material_reserf)
    end

    assert_redirected_to material_reserves_url
  end
end
