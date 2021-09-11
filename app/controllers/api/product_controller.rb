class Api::ProductController < ApplicationController
  class Admin::ManageProductController < AdminApplicationController
    before_action :get_poduct, only: %i[edit_poduct update_poduct delete_poduct]
    before_action :get_categories, only: %i[new_product]

    def show_poducts
      products = Product.all.includes(:category)
      render json: products, status: :ok
    end

    def new_product
      product = Product.new
    end

    def create_product
      product = Product.new(product_params)
      if product.save
        render json: product, status: :ok
      else
        render json: {error: "Không thể tạo sản phẩm"}, status: :not_found
      end
    end

    def edit_product
    end

    def update_product
      if product.present?
        product.update(product_params)
        render json: product, status: :ok
      else
        render json: {error: "Không thể cập nhật sản phẩm"}, status: :not_found
      end
    end

    def delete_product
      if product.present?
        product.delete
        render json: {success: "Xóa sản phẩm #{product.id} thành công"}, status: :ok
      else
        render json: {error: "Không thể cập nhật product"}, status: :not_found
      end
    end

    private
    def get_product
      product = Product.find_by(id: params[:id])
    end

    def get_categories
      categories = Category.all
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :view_count, :category_id)
    end
  end

end
