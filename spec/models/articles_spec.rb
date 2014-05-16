require 'spec_helper'

describe Article do
  it { should validate_presence_of(:title) }
  it { should allow_value('http://foo.com', 'http://bar.com/baz').for :url }
  it { should_not allow_value('asdfjkl').for(:url) }
end
