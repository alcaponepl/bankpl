require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
  	@client = Client.create!(
  		name: 'Jan', surname: 'Nowak',
  		email: 'jan@oent.pl',
  		phone: '545-852-963')
  end

  test "init" do
  	a = @client.accounts.new
  end

  test "number" do
  	a = @client.accounts.create!
  	assert a.number.present?
  	assert a.number > 1
  end
end
