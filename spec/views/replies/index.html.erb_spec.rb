require 'spec_helper'

describe "replies/index" do
  before(:each) do
    assign(:replies, [
      stub_model(Reply),
      stub_model(Reply)
    ])
  end

  it "renders a list of replies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
