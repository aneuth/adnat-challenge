require "test_helper"

class OrganisationTest < ActiveSupport::TestCase

  test "should not allow duplicate organisation names" do
    org1 = Organisation.create(name: "Burger King")
    org2 = Organisation.create(name: "Burger King")
    org1.save
    assert_not org2.save, "Saved a duplicate organisation name"
  end

  test "should not save an organisation without an hourly rate" do
    org = Organisation.new
    assert_not org.save, "Saved organisation without an hourly rate"
  end

end
