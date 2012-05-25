FactoryGirl.define do
	
    factory :user do
			email "sedin@railsfactory.org"
			password "123456"
    end
	
  factory :api_list do
			name "api"
			status true
			position 1
    end
                
	factory :api_method do |f|
		f.association :api_list
		f.name "Api_Method_Name"
		f.description "Api_Method_Description"
		f.resource_url "http://sample.com"
		f.verb "Api_Method_Verb"
		f.request_url "http://sample.com"
		f.success_response 'success'
		f.error_response ''
		f.position 1
		f.request_body "{sample : {sample1}}"
		f.notes "notes1"
		end
		
	factory :parameter do |f|
		f.association :api_method
		f.name "Parameter1" 
		f.description "Api_Method_Parameter"
		f.validation  ""
		f.is_request  true 
		f.position 1 
	end
	factory :static_page do |f|
				f.name "Static1" 
				f.description "Static Description"
end
	
end