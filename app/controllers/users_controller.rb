class UsersController < ApplicationController
	def new
		@page_title="Add User"
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = 'User Created'
			redirect_to admin_users_path
		else
			render 'new'
			
		end
		
	end


	def edit
		@users = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to admin_users_path
		else
			render 'new'
			
		end
		
	end

	def destroy
		@user=User.find(params[:id])
		@user.destroy
		redirect_to admin_users_path
		
	end

	def create
    @user = User.new(user_params)
    if @user.save
       session[:user_id] = user.id
       redirect_to admin_users_path
    else
      render 'new'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
