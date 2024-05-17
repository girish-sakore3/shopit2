class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show update destroy ]

  # GET /carts
  def index
    @carts = Cart.all
    json: { carts: @carts }, status: :ok
  end

  # GET /carts/1
  def show
    json: { cart: @cart }, status: :ok
  end

  # POST /carts
  def create
    @cart = Cart.new(cart_params)

    if @cart.save
      render json: { cart: @cart }, status: :created
    else
      render json: { errors: @cart.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      render json: { cart: @cart }, status: :ok
    else
      render json: { errors: @cart.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /carts/1
  def destroy
    if @cart.destroy
      render json: { message: "Cart destroyed!" }, status: :accepted
    else
      render json: { errors: "Something went wrong!" }, status: :bad_request
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.fetch(:cart, {})
    end
end
