class Admin::ManageUserController < AdminApplicationController

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

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :sex, :is_admin)
  end
end
