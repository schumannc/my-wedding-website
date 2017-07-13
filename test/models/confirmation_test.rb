require 'test_helper'

class ConfirmationTest < ActiveSupport::TestCase
  def setup
  	@confirmation = Confirmation.new(name:"Exemplo nome", email:"exemplo@mail.com", 
  		guets:"2", phone:"923939-3939", ip:"123.423.422")
  end

  test "should be valid" do 
  	assert @confirmation.valid?
  end

  #test de presença	

  test "name should be present" do
  	@confirmation.name = "  "
  	assert_not @confirmation.valid?
  end

  test "email should be present" do
  	@confirmation.email = "   "
  	assert_not @confirmation.valid?
  end

  test "phone should be present" do
    @confirmation.phone = "   "
    assert_not @confirmation.valid?
  end

  test "guets should be present" do
    @confirmation.guets = "   "
    assert_not @confirmation.valid?
  end

  test "ip should be present" do
    @confirmation.ip = "   "
    assert_not @confirmation.valid?
  end
  #test de tamanho

  test "name should not be too long" do
  	@confirmation.name = "a" * 51
  	assert_not @confirmation.valid?
  end

  test "email should not be too long" do
  	@confirmation.email = "a" * 244 + "@exemplo.com"
  	assert_not @confirmation.valid?
  end

  test "phone should not be too long" do
    @confirmation.phone = "a" * 12
    assert_not @confirmation.valid?
  end

  test "phone should not be too short" do
    @confirmation.phone = "a" * 9
    assert_not @confirmation.valid?
  end

 #test de formato

  test "email validation should get a valid address" do
  	valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
    	@confirmation.email = valid_address
    	assert @confirmation.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email adress should be unique" do 
  	duplicate_confirmation = @confirmation.dup
    duplicate_confirmation.email = @confirmation.email.upcase
  	@confirmation.save
  	assert_not duplicate_confirmation.valid?
  end

end
