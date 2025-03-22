require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe "validations" do
    it "has a valid factory" do
      admin = Admin.new(email_address: "test@example.com", password: "password", password_confirmation: "password")
      expect(admin).to be_valid
    end
  end

  describe "normalizations" do
    it "normalizes email_address by stripping and downcasing" do
      admin = Admin.new(email_address: " Test@Example.com ")
      expect(admin.email_address).to eq("test@example.com")
    end
  end

  describe ".authenticate_by" do
    let!(:admin) { Admin.create!(email_address: "test@example.com", password: "password", password_confirmation: "password") }

    context "with valid credentials" do
      it "returns the admin" do
        authenticated = Admin.authenticate_by(email_address: "test@example.com", password: "password")
        expect(authenticated).to eq(admin)
      end

      it "accepts upcased email" do
        authenticated = Admin.authenticate_by(email_address: "TEST@example.com", password: "password")
        expect(authenticated).to eq(admin)
      end
    end

    context "with invalid credentials" do
      it "returns nil with wrong password" do
        authenticated = Admin.authenticate_by(email_address: "test@example.com", password: "wrong_password")
        expect(authenticated).to be_nil
      end

      it "returns nil with non-existent email" do
        authenticated = Admin.authenticate_by(email_address: "nonexistent@example.com", password: "password")
        expect(authenticated).to be_nil
      end
    end
  end
end
