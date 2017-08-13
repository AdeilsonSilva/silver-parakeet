require 'test_helper'

class ArmamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @armament = armaments(:one)
  end

  test "should get index" do
    get armaments_url
    assert_response :success
  end

  test "should get new" do
    get new_armament_url
    assert_response :success
  end

  test "should create armament" do
    assert_difference('Armament.count') do
      post armaments_url, params: { armament: { manufacturer: @armament.manufacturer, serial_number: @armament.serial_number } }
    end

    assert_redirected_to armament_url(Armament.last)
  end

  test "should show armament" do
    get armament_url(@armament)
    assert_response :success
  end

  test "should get edit" do
    get edit_armament_url(@armament)
    assert_response :success
  end

  test "should update armament" do
    patch armament_url(@armament), params: { armament: { manufacturer: @armament.manufacturer, serial_number: @armament.serial_number } }
    assert_redirected_to armament_url(@armament)
  end

  test "should destroy armament" do
    assert_difference('Armament.count', -1) do
      delete armament_url(@armament)
    end

    assert_redirected_to armaments_url
  end
end
