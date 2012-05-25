require 'spec_helper'

describe Parameter do

  before(:each) do
@parameter=Parameter.create(:parameter)
end

	
	it "Should belongs_to api_method" do
@parameter.should  belong_to (:api_method)
  end
	
	def self.params_list(id,type)
		find(:all, :conditions => ['api_method_id=? AND is_request=?',id,type],:order => 'position')
	end
	
	it "find the parameter" do
	p	Parameter.params_list(@parameter.id,@parameter.is_request)
	end
	
end
