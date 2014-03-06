require 'pry'
require 'CSV'


class TaxPayer
  def initialize (first_name, last_name, annual_income, tax_paid, tax_rate)
    @first_name = first_name
    @last_name = last_name
    @annual_income = annual_income
    @tax_paid = tax_paid
    @tax_rate = tax_rate
  end

  attr_reader :first_name
  attr_reader :last_name
  attr_reader :annual_income
  attr_reader :tax_paid
  attr_reader :tax_rate

  def tax_refund
    (@annual_income * @tax_rate / 100.to_f - @tax_paid).to_i
  end

end


def import_csv(filename)
  accounts = {}

  CSV.foreach(filename, headers: true) do |row|
    accounts[row[0] + " " + row[1]] = TaxPayer.new(row[0], row[1], row[2].to_i, row[3].to_i, row[4].to_i)

  end
  accounts
end

accounts = import_csv('tax_data.csv')

accounts.each do |key, object|
  if object.tax_refund < 0
  puts "#{object.first_name} #{object.last_name}  will receive a refund of $#{object.tax_refund * -1}"
  else
    puts "#{object.first_name} #{object.last_name} owes $#{object.tax_refund} in taxes."
  end
end



