class Admin::ManageUserController < AdminApplicationController
  before_action :get_user, only: %i[edit_user update_user delete_user]

  def show_users
    @users = User.all
  end

  def new_user
    @user = User.new
  end

  def create_user
    user = User.new(user_params)
    if user.save
      redirect_to admin_users_path, notice: "Tạo user thành công"
    else
      render json: {error: "Không thể tạo user"}, status: :not_found
    end
  end

  def edit_user
  end

  def update_user
    if @user.present?
      @user.update(user_params)
      redirect_to admin_users_path, notice: "Update user thành công"
    else
      render json: {error: "Không thể cập nhật user"}, status: :not_found
    end
  end

  def delete_user
    if @user.present?
      @user.delete
      redirect_to admin_users_path, notice: "Update user thành công"
    else
      render json: {error: "Không thể cập nhật user"}, status: :not_found
    end
  end

  private
  def get_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :sex, :is_admin)
  end
end
