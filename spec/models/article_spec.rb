require 'spec_helper'

describe Article do
  it { should validate_presence_of(:title) }
  it { should allow_value('http://samplearticle.com').for(:url) }
  it { should_not allow_value('samplearticle.com').for(:url) }
end
