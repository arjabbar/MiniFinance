class Expense < Exchange
  validates :biller_id, presence: true

  alias_method :cost, :price
end
