require 'spec_helper'

describe "replies/new" do
  before(:each) do
    assign(:reply, stub_model(Reply).as_new_record)
  end

  it "renders new reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => replies_path, :method => "post" do
    end
  end
end
