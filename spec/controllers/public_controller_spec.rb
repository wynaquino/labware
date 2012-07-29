require 'spec_helper'

include Capybara::DSL
include Devise::TestHelpers

describe PublicController do

  describe "GET site about page" do
     it "should contain about" do
      visit '/about'
      page.should have_selector('h1',
                          :text => "About")
    end  
  end

  describe "GET site contact page" do
     it "should contain contact" do
      visit '/contact'
      page.should have_selector('h1',
                          :text => "Contact")    end
  end

  describe "Testing access to the home page" do
     it "should contain welcome information" do
      visit '/'
      page.should have_content('Welcome to Labware')
    end
  end
  
  describe "Testing a public user clicking a public post" do
      it "should be public" do
        visit '/'
        click_link 'check this out'
        page.should have_content "Here i am"
      end
  end
  
  describe "Testing a public user clicking accessing a private post" do
      it "should be private" do
        visit 'http://localhost:3000/groups/new-section'
        page.should have_content "Group is set to private"
      end
  end
  
  describe "Testing sign up page by creating an account" do
      it "Sign up test account" do
        visit '/'
        click_link 'Sign up'
        page.should have_content "Sign up"
        fill_in "Email", :with => 'user22@gmail.com'
        fill_in "Username", :with => 'user22'
        fill_in "Password", :with => '111111'
        fill_in "Password confirmation", :with => '111111'
        click_button :submit
        page.should have_content "Welcome! You have signed up successfully."
      end
  end
  
  describe "Testing sign in page by signing in" do
      it "Sign in to test account" do
        visit '/'
        click_link 'Sign in'
        page.should have_content "Sign in"
        fill_in "Email", :with => 'user1@gmail.com'
        fill_in "Password", :with => 'ppppp1'
        click_button "Sign in"
        page.should have_content "Signed in successfully"
      end
  end
  

end