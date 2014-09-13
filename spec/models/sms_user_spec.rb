require 'rails_helper'

RSpec.describe SmsUser, :type => :model do

  it 'should get created with plausible US number' do
    s=SmsUser.new(phone: '16125551212')
    expect(s.save).to be true
  end

  it 'should not get created without a number' do
    s=SmsUser.new
    expect(s.save).to be false
  end

  it 'should not get created with a bad number' do
    s=SmsUser.new(phone: '22442555121')
    expect(s.valid?).to be false
  end


end
