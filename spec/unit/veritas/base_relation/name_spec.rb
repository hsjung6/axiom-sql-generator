require 'spec_helper'

describe BaseRelation, '#name' do
  subject { object.name }

  let(:klass)  { BaseRelation                  }
  let(:header) { [ [ :id, Integer ] ]          }
  let(:body)   { [ [ 1 ] ].each                }
  let(:object) { klass.new(name, header, body) }

  context 'when name is a frozen String' do
    let(:name) { 'users'.freeze }

    it_should_behave_like 'an idempotent method'

    it { should equal(name) }

    it { should be_frozen }
  end

  context 'when name is a String' do
    let(:name) { 'users' }

    it_should_behave_like 'an idempotent method'

    it { should_not equal(name) }

    it { should eql(name) }

    it { should be_frozen }
  end

  context 'when name responds to #to_s' do
    let(:name) { :users }

    it_should_behave_like 'an idempotent method'

    it { should_not equal(name) }

    it { should eql(name.to_s) }

    it { should be_frozen }
  end
end