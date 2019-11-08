# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Account, type: :model do
  subject do
    described_class.new(email: 'test@test.com', password: 'Anything')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a email' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without a password' do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it 'is invalid with malformed email' do
    subject.email = 'test'
    expect(subject).to_not be_valid
  end

  context 'when email is not unique' do
    before { described_class.create!(email: 'test@test.com', password: 'Anything') }
    it 'is not valid without a unique email' do
      expect(subject).to be_invalid
    end
  end
end
