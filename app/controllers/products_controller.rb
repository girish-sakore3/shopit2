class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products.json
  def index
  @products = Product.all
  render json: @carts, status: :ok
  end

  # GET /products/1.json
  def show
    render json: @cart, status: :ok
  end

  # POST /products.json
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1.json
  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1.json
  def destroy
    @product.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.fetch(:product, {})
    end
end
