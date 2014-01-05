# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
module Seeds

	module Settings
		NUM_USERS = 50
		NUM_ASSETS = 25
		NUM_BILLERS = 10
		NUM_EXPENSES = 25
		module RandomUserGenerator
			URL = "http://api.randomuser.me/0.2/portraits/%s/%s.jpg"
			POSSIBLE_SEXES = 'men', 'women'
			MIN_ID = 1
			MAX_ID = 50
		end

	end

	class Seeder

		include Settings

		def self.generate_all_records
			self.generate_users
			self.generate_billers
			self.generate_assets
			self.generate_expenses
		end

		def self.generate_users
			NUM_USERS.times do
				User.create!(
					first_name: Faker::Name::first_name,
					last_name: Faker::Name::last_name,
					email: Faker::Internet::email,
					password: 'keshia',
					password_confirmation: 'keshia',
					bio: Faker::Lorem::paragraphs(3).join('\n'),
				image_url: random_image)
			end 
			create_me
		end

		def self.create_me
			User.create(
				first_name: 'Abdur',
				last_name: 'Jabbar',
				email: 'arjabbar@yahoo.com',
				password: 'keshia',
				password_confirmation: 'keshia',
				image_url: "https://secure.gravatar.com/avatar/0065199acc846d3af52415becb0fcf12",
				bio: "A cool developer...")
		end

		def self.generate_billers
			NUM_BILLERS.times do
				Biller.create!(
					name: Faker::Company.name,
					website: Faker::Internet.http_url,
					phone: Faker::PhoneNumber.short_phone_number)
			end
		end

		def self.generate_assets
			@me = @me || User.last
			NUM_ASSETS.times do
				Asset.create!(
					user: @me,
					amount_in_cents: rand(10..2000),
					recurring: [true, false].sample,
					start_date: DateTime.now,
					end_date: DateTime.now,
					source: Faker::Company.name)
			end
		end

		def self.generate_expenses
			@me = @me || User.last
			NUM_EXPENSES.times do
				Expense.create!(
					user: @me,
					amount_in_cents: rand(10..2000),
					recurring: [true,false].sample,
					start_date: DateTime.now,
					end_date: DateTime.now,
					biller: Biller.random)
			end
		end

		def self.random_image
			sex = RandomUserGenerator::POSSIBLE_SEXES.sample
			id = rand RandomUserGenerator::MIN_ID..RandomUserGenerator::MAX_ID
			RandomUserGenerator::URL % [sex, id]
		end

	end

end

Seeds::Seeder.generate_all_records
