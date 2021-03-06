require 'spec_helper'

RSpec.describe "contacts/new", type: :view do
  before(:each) do
    assign(:contact, Contact.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :mobile => "MyString",
      :home_phone => "MyString",
      :office_phone => "MyString",
      :street_address => "MyString",
      :city => "MyString",
      :state => "MyString",
      :country => "MyString",
      :permalink => "MyString"
    ))
  end

  it "renders new contact form" do
    render

    assert_select "form[action=?][method=?]", contacts_path, "post" do

      assert_select "input#contact_first_name[name=?]", "contact[first_name]"

      assert_select "input#contact_last_name[name=?]", "contact[last_name]"

      assert_select "input#contact_email[name=?]", "contact[email]"

      assert_select "input#contact_mobile[name=?]", "contact[mobile]"

      assert_select "input#contact_home_phone[name=?]", "contact[home_phone]"

      assert_select "input#contact_office_phone[name=?]", "contact[office_phone]"

      assert_select "input#contact_street_address[name=?]", "contact[street_address]"

      assert_select "input#contact_city[name=?]", "contact[city]"

      assert_select "input#contact_state[name=?]", "contact[state]"

      assert_select "input#contact_country[name=?]", "contact[country]"

    end
  end
end
