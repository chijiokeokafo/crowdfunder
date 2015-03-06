class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def profile
		@user = current_user
		render :show
	end

	def create
		@user = User.new(user_params)

		if @user.save
			auto_login(@user)

			redirect_to projects_url
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
