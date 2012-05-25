require 'spec_helper'

describe ApiMethod do

  before(:each) do
@api_method=FactoryGirl.create(:api_method)
end

it "Should have_many parameters" do
@api_method.should  have_many (:parameters)
  end
	
	it "Should belongs_to api_list" do
@api_method.should  belong_to (:api_list)
  end
	
	  it "should have the scope" do
		ApiMethod.should respond_to(:list_methods)
	end
	
	 it "should have the scope" do
		ApiMethod.should respond_to(:order_by_postion)
	end
	
end
