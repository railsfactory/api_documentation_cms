class AdminController < ApplicationController

	before_filter :authenticate_user!, :except=>['index']
	def index
		@user = User.first
	end

	def settings
		@user = current_user
		unless @user.nil?
      if @user.email != "admin@spreeapi.com"
        redirect_to '/users/sign_in'
      end
    else
      redirect_to '/users/sign_in'
		end
  end

	def update_settings
    params[:admin][:edit_enable] = false unless params[:admin][:edit_enable]
		@user = current_user
		@user = @user.update_attributes(params[:admin])
    respond_to do |format|
      flash[:success] ="Your settings has been saved successfully"
      format.html {redirect_to '/settings'}
		end
	end


end
