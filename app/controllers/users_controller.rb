class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to frontpage_index_url, notice: "Created user"
    else
      render "new"
    end
  end

  def edit
  end

private

  def user_params
    params.require(:user).permit(:name, :password,:password_confirmation, :email, :phone_number)
  end


end
