require_relative '../../test_helper'
 
describe Colirby do
 
  it "VERSION must be defined" do
    Colirby::VERSION.wont_be_nil
  end
 
end