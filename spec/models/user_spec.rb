require 'rails_helper'
RSpec.describe User, type: :model do
  subject { User.new(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.') }
  before { subject.save }

  it 'Name must not be blank' do
    subject.Name = nil
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be an integer ' do
    subject.PostsCounter = 'xyz'
    expect(subject).to_not be_valid
  end

  it 'PostsCounter must be  greater than or equal to zero' do
    subject.PostsCounter = -1
    expect(subject).to_not be_valid
  end
end
