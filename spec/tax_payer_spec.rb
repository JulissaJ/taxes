require 'rspec'
require_relative '../lib/tax_payer'

describe TaxPayer do
  it "has first name" do
    x = TaxPayer.new('Johnny', "Smith", 120000, 28000, 38)
    expect(x.first_name).to eq("Johnny")
  end

  it "has last name" do
    taxguy = TaxPayer.new('Jane', 'Doe', 140000, 30000, 40)
    expect(taxguy.last_name).to eq("Doe")
  end


  it "has annual income" do
    taxguy = TaxPayer.new("Liz", "Lemon", 200000, 21000, 30)
    expect(taxguy.annual_income).to eq(200000)
  end

  it "has tax paid" do
    taxguy = TaxPayer.new("Orson", "Orisillio", 40000, 8800, 18)
    expect(taxguy.tax_paid).to eq(8800)
  end

  it "has tax rate" do
    taxguy = TaxPayer.new("Eric", "Schmidt", 54000, 0, 28)
    expect(taxguy.tax_rate).to eq(28)
  end

  it "calculates tax refund" do
    taxguy = TaxPayer.new('Jane', 'Doe', 140000, 30000, 40)
    expect(taxguy.tax_refund).to eq(26000)
  end

  it "imports file" do
    expect(import("tax_data.csv")).to_not eq(nil)
  end

  it "outputs a hash of tax payers" do
    expect(import("tax_data.csv")).to eq(Hash.new)
  end
end
