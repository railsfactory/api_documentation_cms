require 'spec_helper'

describe ApiListsController ,:type=>"controller" do
	
		before(:each) do
			@api_list = FactoryGirl.create(:api_list)
		end
	def parameter_param
			{
			:name=> "api",
			:status=> true,
			:position=> 1
			}
		end
	
	describe "GET index" do
		it "find all the api lists" do
			get :index 
    @api_lists = ApiList.all
		#~ response.should be_success
		end
	end
	
	describe "GET 	Show" do
		it "find a particular apilist" do
			get :show , :id => @api_list.id
      @api_list = ApiList.find_by_id(@api_list.id)
		end
	end
	
	describe "GET 	New" do
		it "to create a new apilist" do
			get :new 
			    @api_list = ApiList.new
  #~ assigns(:api_list).should be_a_new(ApiList)
		end
	end
	
	describe "GET 	Edit" do
		it "to edit a particular apilist" do
			get :edit , :id => @api_list.id
			  @apilist = ApiList.find_by_id(@api_list.id)
		end
	end
	
	describe "POST 	Create" do
		it "to create a new apilist" do
		post :create , :id => @api_list.id
			@api_list = ApiList.new(parameter_param)
			if @api_list.save
			#~ response.should be_success
			else
	    response.should render_template("new")
		end
	end
	end

	describe "PUT 	UPDATE" do
		it "to update a particular api_list value" do
     put :update ,:id => @api_list.id
      @api_list = ApiList.find_by_id(@api_list.id)
			@api_list.update_attributes(parameter_param)
		end
	end
	
	describe "DELETE api_destory" do
		it "delete a particular api_list" do
			delete :api_destroy , :id => @api_list.id
      @api_list = ApiList.find_by_id(@api_list.id)
			@api_list.destroy rescue nil
		end
	end
	
		describe "DELETE destroy" do
		it "delete a particular api_list" do
			delete :destroy , :id => @api_list.id
      @api_list = ApiList.find_by_id(@api_list.id)
			@api_list.destroy rescue nil
		end
	end
	
end