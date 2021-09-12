class Api::CategoryController < ApplicationController::API
  before_action :get_category, only: %i[edit_category update_category delete_product]

  def show_categories
    categories = Category.all
    render json: categories, status: :ok
  end

  def new_category
    category = Category.new
  end

  def create_category
    category = Category.new(category_params)
    if category.save
      render json: category, notice: "Tạo mục lục thành công"
    else
      render json: {error: "Không thể tạo mục lục"}, status: :not_found
    end
  end

  def edit_category
  end

  def update_category
    if category.present?
      category.update(category_params)
      render json: category, notice: "Update mục lục thành công"
    else
      render json: {error: "Không thể cập nhật mục lục"}, status: :not_found
    end
  end

  def delete_category
    if category.present?
      category.delete
      render json: {success: "Xóa mục lục thành công"}, notice: "Update mục lục thành công"
    else
      render json: {error: "Không thể cập nhật mục lục"}, status: :not_found
    end
  end

  private
  def get_category
    category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
