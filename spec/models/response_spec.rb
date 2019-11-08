# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Response, type: :model do
  subject do
    letter_account = Account.create(email: '1@1.com', password: 'Anything')
    letter = Letter.create(account: letter_account, content: 'Anything')

    response_account = Account.create(email: '2@2.com', password: 'Anything')
    described_class.new(account_id: response_account.id, letter: letter, content: 'Anything')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without content' do
    subject.content = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an letter' do
    subject.letter = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without an account' do
    subject.account = nil
    expect(subject).to_not be_valid
  end
end
