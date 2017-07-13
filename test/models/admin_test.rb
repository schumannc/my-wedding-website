require 'test_helper'

class AdminTest < ActiveSupport::TestCase
	def setup
		@user = Admin.new(user: "Henrique", password: "123", password_confirmation: "123");
	end

end
