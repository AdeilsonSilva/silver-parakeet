class Reserve < ApplicationRecord
  has_many :soldier
  has_many :material_reserve
  has_many :loan, through: :material_reserve

  def not_loans
    Loan.where('id NOT IN (:ids)', ids: self.loans.pluck(:id))
  end
end
