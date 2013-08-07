require 'spec_helper'

describe "an instance generated by a factory that inherits from another factory" do
  before do
    define_model("User", name: :string, admin: :boolean, email: :string, upper_email: :string, login: :string)

    FactoryGirl.define do
      factory :user do
        name  "John"
        email { "#{name.downcase}@example.com" }
        login { email }

        factory :admin do
          name "admin"
          admin true
          upper_email { email.upcase }
        end

        factory :guest do
          email { "#{name}-guest@example.com" }
        end

        factory :no_email do
          email ""
        end

        factory :bill do
          name  { "Bill" }  #block to make  attribute dynamic
        end
      end
    end
  end

  describe "the parent class" do
    subject     { FactoryGirl.create(:user) }
    it          { should_not be_admin }
    its(:email) { should eq "john@example.com" }
  end

  describe "the child class redefining parent's static method used by a dynamic method" do
    subject           { FactoryGirl.create(:admin) }
    it                { should be_kind_of(User) }
    it                { should be_admin }
    its(:name)        { should eq "admin" }
    its(:email)       { should eq "admin@example.com" }
    its(:upper_email) { should eq "ADMIN@EXAMPLE.COM"}
  end

  describe "the child class redefining parent's dynamic method" do
    subject     { FactoryGirl.create(:guest) }
    it          { should_not be_admin }
    its(:name)  { should eq "John" }
    its(:email) { should eql "John-guest@example.com" }
    its(:login) { should eq "John-guest@example.com" }
  end

  describe "the child class redefining parent's dynamic attribute with static attribute" do
    subject     { FactoryGirl.create(:no_email) }
    its(:email) { should eq "" }
  end

  describe "the child class redefining parent's static attribute with dynamic attribute" do
    subject     { FactoryGirl.create(:bill) }
    its(:name)  { should eq "Bill" }
  end
end

describe "nested factories with different parents" do
  before do
    define_model("User", name: :string)

    FactoryGirl.define do
      factory :user do
        name  "Basic User"

        factory :male_user do
          name "John Doe"
        end

        factory :uppercase_male_user, parent: :male_user do
          after(:build) {|user| user.name = user.name.upcase }
        end
      end
    end
  end

  it "honors :parent over the factory block nesting" do
    expect(FactoryGirl.build(:uppercase_male_user).name).to eq "JOHN DOE"
  end
end
