require 'rails_helper'
RSpec.describe Post, type: :model do
  subject { Post.new(Title: 'Hello', Text: 'This is my first post', CommnetsCounter: 8, LikesCounter: 15) }
  before { subject.save }

  it 'Title  must not be blank' do
    subject.Title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must not exceed 250 characters' do
    subject.Title = 'x' * 251
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be an integer' do
    subject.CommnetsCounter = 'x'
    expect(subject).to_not be_valid
  end

  it 'CommentsCounter must be greater than or equal to zero.' do
    subject.CommnetsCounter = -7
    expect(subject).to_not be_valid
  end

  it 'LikesCounter  must be an integer' do
    subject.LikesCounter = 'x'
    expect(subject).to_not be_valid
  end

  it 'LikesCounter  must be greater than or equal to zero.' do
    subject.LikesCounter = -7
    expect(subject).to_not be_valid
  end
end
