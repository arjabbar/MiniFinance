class FinancesController < AuthenticatedController
  before_filter :authenticate!, :set_exchanges
  respond_to :json

  def index
    render json: @exchanges, each_serializer: ExchangeSerializer
  end

  def show
    render json: @exchanges.find(params[:id])
  end

  def update
    exchange = @exchanges.find exchange_params[:id]
    exchange.assign_attributes exchange_params
    if exchange.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def destroy
    if @exchanges.delete(params[:id]) == 0
      head :ok 
    else
      head :not_found
    end
  end

  def create
    exchange = Exchange.new exchange_params
    if exchange.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def exchange_params
    params.require(:exchange).permit(:user_id, :amount_in_cents, :recurring, :type, :start_date, :end_date, :biller_id, :source)
  end

  def set_exchanges
    return false if @current_user.nil?
    @exchanges = @current_user.exchanges
  end
end
