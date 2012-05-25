class Parameter < ActiveRecord::Base
	belongs_to :api_method
	default_scope :order => 'position'

	def self.params_list(id,type)
		find(:all, :conditions => ['api_method_id=? AND is_request=?',id,type],:order => 'position')
	end

end
