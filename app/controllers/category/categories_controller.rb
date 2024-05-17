class Category::CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show update destroy ]

  # GET /category/categories
  def index
    @categories = Category::Category.all
    render json: @categories
  end

  # GET /category/categories/1
  def show
  end

  # POST /category/categories
  def create
    @category = Category::Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /category/categories/1
  def update
    if @category.update(category_params)
      render json: @category, status: :ok
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /category/categories/1
  def destroy
    render json: @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category::Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.fetch(:category, {})
    end
end
