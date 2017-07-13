require 'test_helper'

class CheckoutControllerTest < ActionController::TestCase
  test "sucess" do
     post :sucesso, {external_reference: 0}
     assert_template :sucesso
  end

  test "falha" do
  	 post :falha, {external_reference: 0}
     assert_template :falha
  end
end
