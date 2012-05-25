class ApiMethod < ActiveRecord::Base
	has_many :parameters, :dependent => :destroy
	belongs_to :api_list
	#~ validates :name, :verb, :resource_url, :presence => true
  default_scope :order => 'position'
  scope :list_methods,lambda{|api_list_id| where('api_list_id=?',api_list_id).order('position')}
  scope :order_by_postion, order("position asc")
end
