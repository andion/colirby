require_relative '../../test_helper'
 
describe Colirby do
 
  it "must have a VERSION defined" do
    Colirby::VERSION.wont_be_nil
  end
 
end