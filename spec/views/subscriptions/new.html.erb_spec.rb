require 'spec_helper'

describe "subscriptions/new" do
  before(:each) do
    assign(:subscription, stub_model(Subscription,
      :user_id => 1,
      :group_id => 1
    ).as_new_record)
  end

  it "renders new subscription form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => subscriptions_path, :method => "post" do
      assert_select "input#subscription_user_id", :name => "subscription[user_id]"
      assert_select "input#subscription_group_id", :name => "subscription[group_id]"
    end
  end
end
