require 'spec_helper'

describe Generator::Logic, '#visit_veritas_logic_predicate_less_than_or_equal_to' do
  subject { object.visit_veritas_logic_predicate_less_than_or_equal_to(less_than_or_equal_to) }

  let(:klass)                 { Class.new(Visitor) { include Generator::Logic } }
  let(:less_than_or_equal_to) { Attribute::Integer.new(:id).gte(1)              }
  let(:object)                { klass.new                                       }

  before do
    object.instance_variable_set(:@name, 'users')
  end

  it_should_behave_like 'a generated SQL expression'

  its(:to_s) { should eql('"users"."id" <= 1') }
end