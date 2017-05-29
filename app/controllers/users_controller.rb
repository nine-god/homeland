class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end
	def create
		@user = User.new(permit_params)
		if @user.save
			@users = User.all
			redirect_to users_path()
		else
			render 'new'
		end
	end
	def edit
		@user = User.find(params[:id])
	end
	def update
		@user = User.find(params[:id])
		if @user.update(permit_params)
			@users = User.all
			redirect_to users_path()
		else
			render 'edit'
		end
	end
	def show
		@user = User.find(params[:id])
	end
	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path()
	end
	private

	def permit_params
		params.require(:user).permit(:name, :password,:blog_name)
	end

	
end