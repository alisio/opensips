require 'spec_helper'
describe 'opensips' do
  context 'with default values for all parameters' do
    it { should contain_class('opensips') }
  end
end
