class Exchange < ActiveRecord::Base
  validates :type, presence: true
  monetize :amount_in_cents, as: :price
  belongs_to :user
  belongs_to :biller

end
