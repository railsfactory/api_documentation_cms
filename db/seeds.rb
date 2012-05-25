# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#*******************************#creating User**************************
User.create(:email => "admin@apidoc.com", :password => "apidoc", :password_confirmation => "apidoc")

api_list = ApiList.create(:name => "User", :position => "1")


ApiMethod.create(:api_list_id	=> api_list.id, :name => "User.SignUp", :description => "To register a new account.", :resource_url => "/users.json", :verb => "POST", :request_url => "http://spreeapi.railsfactory.com/users.json", :success_response => "{'user':{'email':'email@spree.com','persistence_token':null}}", :error_response => "{'code':'2011','message':'Please enter a Password'}", :position => "1", :request_body => "{'user':{'email':'email@spree.com', 'password':'1234564', 'password_confirmation':'1234564'}}")

ApiMethod.create(:api_list_id	=> api_list.id, :name => "User.SignOut", :description => "This method is used to close the User session.", :resource_url => "/users/logout", :verb => "Get", :request_url => "http://spreeapi.railsfactory.com/user/logout.json?authentication_token=Q4tyt6ryihgft", :success_response => "{'code':'2033','message':'logged out sucessfully'}", :error_response => "{'code':'2039','message':'Bad request'}", :position => "2", :request_body => "")

api_list = ApiList.create(:name => "Products", :position => "2")

ApiMethod.create(:api_list_id	=> api_list.id, :name => "Products.list", :description => "To view all the existing Products", :resource_url => "/products.json", :verb => "GET", :request_url => "http://spreeapi.railsfactory.com/products.json?authentication_token=HItfNtYHxehwpBQ3WO4k", :success_response => "{

'response' : 'success, 'status' : '200',

'products':

 [
    {
        'product':
        {
            'available_on':'2012-03-08T10:38:53Z',
            'count_on_hand':75,
            'created_at':'2012-03-08T10:38:53Z',
            'deleted_at':null,
            'description':'',
            'id':187438981,
            'meta_description':null,
            'meta_keywords':null,
            'name':'Ruby on Rails Ringer T-Shirt',
            'permalink':'ruby-on-rails-ringer-t-shirt',
            'shipping_category_id':null,
            'tax_category_id':25484906,
            'updated_at':'2012-03-08T10:38:53Z'
        }
    },
    {
        'product':
        {
            'available_on':'2012-03-08T10:38:53Z',
            'count_on_hand':75,
            'created_at':'2012-03-08T10:38:53Z',
            'deleted_at':null,
            'description':'',
            'id':248786582,
            'meta_description':null,
            'meta_keywords':null,
            'name':'Ruby on Rails Mug',
            'permalink':'ruby-on-rails-mug',
            'shipping_category_id':null,
            'tax_category_id':null,
            'updated_at':'2012-03-08T10:38:53Z'
        }
    }
]

}", :error_response => "{'code':'2039','message':'Bad request '}", :position => "1", :request_body => "")

ApiMethod.create(:api_list_id	=> api_list.id, :name => "Products.delete", :description => "To remove the existing Product", :resource_url => "/admin/products/:id.json", :verb => "DELETE", :request_url => "http://spreeapi.railsfactory.com/admin/products/1060500603.json?authentication_token=HItfNtYHxehwpBQ3WO4k ", :success_response => "{'code':'2035','message':'destroyed'}", :error_response => "{'code':'2037','message':'Record not found'}{'code':'2039','message':'Bad request '}", :position => "2", :request_body => "")

