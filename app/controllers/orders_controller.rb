class OrdersController < ApplicationController

  before_action :authenticate_user!

  def index
    @orders = Order.where("user_id = ?", current_user.id)
    #@orders = Order.includes(:product).all
    
  end

  def show
    @order = Order.find(params[:id])

  end

  def new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @orders, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :product_id, :total)
    end

end
