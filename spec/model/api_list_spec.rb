require 'spec_helper'

describe ApiList do
	
	before(:each) do
		@api_list = FactoryGirl.create(:api_list)
	end


	it "Should belongs_to api_methods" do
		@api_list.should  have_many (:api_methods)
	end
		
	 it { should validate_presence_of(:name) }

		it "should have the scope order" do
			ApiList.should respond_to(:order)
		end
		
		it "should have the scope order_by_postion" do
			ApiList.should respond_to(:order_by_postion)
	end
	
end