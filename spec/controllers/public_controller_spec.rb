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
      page.should have_content('Welcome to KitchnDOJO')
    end
  end
  
   
  describe "Testing a public user accessing a private group" do
      it "should be private" do
        visit 'http://localhost:3000/g/privatepg'
        page.should have_content "Group is set to private"
      end
  end
  
  describe "Testing a public user accessing a public group" do
      it "should be public" do
        visit 'http://localhost:3000/g/traininglog'
        page.should have_content "a log for all of our training needs"
      end
  end
  
  describe "Testing sign up page" do
      it "click Sign up link" do
        visit '/'
        click_link 'Sign up'
        page.should have_content "Password confirmation"
      end
  end
  
   

end