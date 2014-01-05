class ExchangeSerializer < ActiveModel::Serializer
  attributes :id, :amount_in_cents, :recurring, :start_date, :end_date, :type, :created_at, :biller, :biller_id
  has_one :biller
end
