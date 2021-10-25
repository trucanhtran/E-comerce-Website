class Admin::ManageProductController < AdminApplicationController
  before_action :get_product, only: %i[show_product edit_product update_product delete_product]
  before_action :get_categories, only: %i[edit_product new_product]

  def show_products
    @products = Product.all.includes(:category)
  end

  def show_product

  end

  def new_product
    @product = Product.new
  end

  def create_product
    product = Product.new(product_params)
    if product.save
      redirect_to admin_products_path, notice: "Tạo sản phẩm thành công"
    else
      render json: {error: "Không thể tạo sản phẩm"}, status: :not_found
    end
  end

  def edit_product
  end

  def update_product
    if @product.present?
      product.images.attach(params[:product][:images])
      @product.update(product_params)
      redirect_to admin_products_path, notice: "Update sản phẩm thành công"
    else
      render json: {error: "Không thể cập nhật sản phẩm"}, status: :not_found
    end
  end

  def delete_product
    if @product.present?
      @product.delete
      redirect_to admin_products_path, notice: "Update product thành công"
    else
      render json: {error: "Không thể cập nhật product"}, status: :not_found
    end
  end

  private
  def get_product
    @product = Product.find_by(id: params[:id])
  end

  def get_categories
    @categories = Category.all
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :view_count, :category_id, images: [])
  end
end
