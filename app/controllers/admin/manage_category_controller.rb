class Admin::ManageCategoryController < AdminApplicationController
  before_action :get_category, only: %i[edit_category update_category delete_product]

  def show_categories
    @categories = Category.all
  end

  def new_category
    @category = Category.new
  end

  def create_category
    category = Category.new(category_params)
    byebug
    if category.save
      byebug
      redirect_to admin_categories_path, notice: "Tạo mục lục thành công"
    else
      render json: {error: "Không thể tạo mục lục"}, status: :not_found
    end
  end

  def edit_category
  end

  def update_category
    if @category.present?
      @category.update(category_params)
      redirect_to admin_categories_path, notice: "Update mục lục thành công"
    else
      render json: {error: "Không thể cập nhật mục lục"}, status: :not_found
    end
  end

  def delete_category
    if @category.present?
      @category.delete
      redirect_to admin_categories_path, notice: "Update mục lục thành công"
    else
      render json: {error: "Không thể cập nhật mục lục"}, status: :not_found
    end
  end

  private
  def get_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
