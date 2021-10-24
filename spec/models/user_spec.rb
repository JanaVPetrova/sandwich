# frozen_string_literal: true

RSpec.describe User do
  subject {
    described_class.new(
      name: 'Example User',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
  }

  it 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      subject.email = valid_address
      expect(subject).to be_valid
    end
  end

  it 'email should be presence' do
    subject.email = '  '
    expect(subject).not_to be_valid
  end

  it 'email should be not be to long' do
    subject.email = ' ' * 255
    expect(subject).not_to be_valid
  end

  it 'email should be saved as lower-case' do
    subject.email = mixed_case_email = 'Test@ExamplE.com'
    subject.save
    expect(subject.reload.email).to eq mixed_case_email.downcase
  end

  it 'password should be at lest 6 symbols' do
    subject.password = subject.password_confirmation = 'a' * 5
    expect(subject).not_to be_valid
  end

  it 'password should be presence' do
    subject.password = subject.password_confirmation = ' ' * 6
    expect(subject).not_to be_valid
  end
end
