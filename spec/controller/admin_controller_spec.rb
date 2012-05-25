require 'spec_helper'
describe AdminController ,:type=>"controller" do
include Devise::TestHelpers

it "should get before_filtered for authenticate_user!" do
      controller.stub!(:authenticate_user!).and_return(true)
end

 before (:each) do
		@user=FactoryGirl.create(:user)
	end
describe "GET index" do
	 it "to find the user first" do
		 User.stub(:new) {mock_model(User,:save=>true)}
		 get :index
		@user = User.first
		#~ response.should be_success
	 end
 end
 
 describe "GET settings" do
	 it "user to set the current settings" do
			controller.stub!(:authenticate_user!).and_return(true)
			p current_user=@user
			get :settings
		unless @user.nil?
      if @user.email != "admin@spreeapi.com"
				#~ response.should redirect_to("/users/sign_in")
      end
    else
			#~ response.should redirect_to("/users/sign_in")
		end
	 end
 end
 
describe "GET update_settings" do
	 it "to update the user information" do
		controller.stub!(:authenticate_user!).and_return(true)
		 put :update_settings, {:admin=>{:edit_enable=>true}}
		@user = @user.update_attributes(:edit_enable=>true)
		#~ response.should be_success
		end
	 end

  end
