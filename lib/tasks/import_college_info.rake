require 'csv'

namespace :import do

  desc "Update College info"
  task college_info: :environment do

    csv_text = File.read("#{Rails.root}/public/colleges_list.csv")
    csv = CSV.parse(csv_text, :headers => true)
    country = Country.where(name: 'India', code: 'IN').first_or_create

    csv.each_with_index do |row, index|
    	puts "===== #{index} ======"
    	college_name = row[4]
      state = row[1]
      district = row[2]
      university_name = row[3]
      university_code = generate_college_code(university_name)

      university = University.find_by(name: university_name)

      if university.blank?
      	university = University.create(name: university_name, code: university_code)
      end

      college_code = generate_college_code(college_name)
      college = university.colleges.build(name: college_name,
      	                    state: state,
      	                    district: district,
      	                    code: college_code,
      	                    country_id: Country.first.id)
      college.save
    end
  end

  def generate_college_code(college_name)
  	college_first_name = college_name.split(' ')[0]
    random_number = 15.times.map{rand(10)}.join

    if college_first_name.length >= 15
    	college_first_name[0...10]
    else
      code = college_first_name + random_number
      code[0...15]
    end
  end
end

