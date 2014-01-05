class BillersController < AuthenticatedController
  before_filter :authenticate!
  respond_to :json

  def index
    render json: Biller.all
  end

  def show
    render json: Bill.find(params[:id])
  end

  def create
    biller = Biller.new biller_params
    if biller.save
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def update
    head :unauthorized
  end

  def destroy
    head :unauthorized
  end

  def biller_params
    params.require(:biller).permit(:name, :website, :phone)
  end
end
