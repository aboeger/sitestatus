class Company < ApplicationRecord
  require 'net/http'
  require 'uri'

  after_create :test_website, :check_for_duplicate

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      create(from_csv_row(row))
    end
  end

  def self.from_csv_row(row)
    {
      company_name: row[0],
      contact: row[1],
      phone: row[2],
      address: row[3],
      website: row[4],
    }
  end

  def self.find_duplicates
     websites = all.pluck(:website)
     duplicates = []
     websites.each do |site|
       if websites.count(site) > 1
         duplicates << site
       end
     end
    duplicates.uniq
  end

  def duplicates
    companies = Company.where.not(id: id).where(website: website)
    if companies.length > 1
      return companies
    end
  end

  def test_website
    status = Net::HTTP.get_response(URI(http_uri)).code
    self.update(website_status: status)
  end

  def http_uri
    "http://www.#{website}"
  end
end
