require 'rails_helper'


RSpec.describe Customer, type: :model do

  before { @customer = Customer.new(name: "Example User")}

  subject { @customer }

  it { should respond_to(:name) }

  it { should be_valid }

  describe 'when name is blank' do
    before { @customer.name = "" }
    it { should_not be_valid }
  end
end