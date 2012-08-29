require 'spec_helper'

describe "replies/edit" do
  before(:each) do
    @reply = assign(:reply, stub_model(Reply))
  end

  it "renders the edit reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => replies_path(@reply), :method => "post" do
    end
  end
end
