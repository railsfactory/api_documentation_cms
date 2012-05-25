require 'spec_helper'

describe StaticPagesController ,:type=>"controller" do
	
		before(:each) do
			@static_page = FactoryGirl.create(:static_page)
		end
		
		def static_page_param
			{
			:name =>  "static_page1" ,
			:description => "description1" ,
			}
		end
	
	describe "GET index" do
		it "find all the static_pages" do
			get :index 
			@static_pages = StaticPage.all
		end
	end
	
	describe "GET 	Show" do
		it "find a particular static_page" do
			get :show , :id => @static_page.id
      @static_page = StaticPage.find_by_id(@static_page.id)
		end
	end
	
	describe "GET 	New" do
		it "to create a new parameter" do
			get :new 
			@parameter = StaticPage.new
		end
	end
	
	describe "GET 	Edit" do
		it "to edit a particular static_page" do
			get :edit , :id => @static_page.id
			  @static_page = StaticPage.find_by_id(@static_page.id)
		end
	end
	
	describe "POST 	Create" do
		it "to create a new static_page" do
		post :create , :id => @static_page.id
			@static_page = StaticPage.new(static_page_param)
			@static_page.save
		end
	end

	describe "PUT 	UPDATE" do
		it "to update a particular static_page" do
     put :update ,:id => @static_page.id
      @static_page = StaticPage.find_by_id(@static_page.id)
			@static_page.update_attributes(static_page_param)
		end
	end
	
	describe "DELETE destroy" do
		it "delete a particular static_page" do
			delete :destroy , :id => @static_page.id
      @static_page = StaticPage.find_by_id(@static_page.id)
			@static_page.destroy
		end
	end
	
end