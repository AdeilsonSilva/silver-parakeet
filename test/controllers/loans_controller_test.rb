require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get loans_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_url
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post loans_url, params: { loan: { accessories_amount: @loan.accessories_amount, accessories_id: @loan.accessories_id, ammunition_amount: @loan.ammunition_amount, ammunition_id: @loan.ammunition_id, armaments_amount: @loan.armaments_amount, armaments_id: @loan.armaments_id, date: @loan.date, material_reserve_id: @loan.material_reserve_id, soldier_id: @loan.soldier_id } }
    end

    assert_redirected_to loan_url(Loan.last)
  end

  test "should show loan" do
    get loan_url(@loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test "should update loan" do
    patch loan_url(@loan), params: { loan: { accessories_amount: @loan.accessories_amount, accessories_id: @loan.accessories_id, ammunition_amount: @loan.ammunition_amount, ammunition_id: @loan.ammunition_id, armaments_amount: @loan.armaments_amount, armaments_id: @loan.armaments_id, date: @loan.date, material_reserve_id: @loan.material_reserve_id, soldier_id: @loan.soldier_id } }
    assert_redirected_to loan_url(@loan)
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end
