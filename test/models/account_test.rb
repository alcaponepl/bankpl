require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  def setup
  	@client = Client.create!(
  		name: 'Jan', surname: 'Nowak',
  		email: 'jan@oent.pl',
  		phone: '545-852-963')
  	@account = @client.accounts.create!
  end

  test "init" do
  	a = @client.accounts.new
  end

  test "number" do
  	assert @account.number.present?
  	assert @account.number > 1
  end


  test "balance" do
    @account = @client.accounts.create
  	@account.balance = "ala"
  	assert @account.invalid?
  	assert @account.errors[:balance].any?
  	@account.balance = 100
  	assert @account.valid?
  	assert @account.errors[:balance].empty?
  end

  test "update_balance" do
    @account.transactions.create(amount: 100, descr: 'wpłata 1')
    @account.transactions.create(amount: 350, descr: 'wpłata 2')
    @account.reload
    assert_equal 450, @account.balance
  end

end
