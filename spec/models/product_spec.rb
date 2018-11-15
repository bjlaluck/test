require 'rails_helper'

describe Product do
  context "when the product is being created" do

    let(:product1) { FactoryBot.build(:product, name: "")}
    let(:product2) { FactoryBot.build(:product, description: "")}
    let(:product3) { FactoryBot.build(:product, image_url: "")}
    let(:product4) { FactoryBot.build(:product, colour: "")}
    let(:product5) { FactoryBot.build(:product, price: "")}
    let(:product6) { FactoryBot.build(:product, image_url: "http://www.google.com")}
    let(:product7) { FactoryBot.build(:product, price: "fff")}


    it "is not valid without a name" do
      expect(product1).not_to be_valid
    end

    it "is not valid without a description" do
      expect(product2).not_to be_valid
    end

    it "is not valid without a image_url" do
      expect(product3).not_to be_valid
    end

    it "is not valid without a colour" do
      expect(product4).not_to be_valid
    end

    it "is not valid without a price" do
      expect(product5).not_to be_valid
    end

    it "is not valid without a image_url that shows image (common formats )" do
      expect(product6).not_to be_valid
    end

    it "is not valid without a price that is actual number" do
      expect(product7).not_to be_valid
    end
  end
end
