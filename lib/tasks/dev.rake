namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(
      name: FFaker::Name.first_name,
      opening_hours: FFaker::Time.datetime,
      tel: FFaker::PhoneNumber.short_phone_number,
      address: FFaker::Address.street_address,
      description: FFaker::Lorem.paragraph,
      category: Category.all.sample,
      image: FFaker::Avatar.image
      )
    end
    puts "have created fake restaurant"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    User.destroy_all

    20.times do |i|
      User.create!(
      name: FFaker::Name.first_name,
      email: FFaker::Internet.disposable_email,
      password: FFaker::Internet.password
      )
    end
    puts "have created fake user"
    puts "now you have #{User.count} user data"
  end


  task fake_comment: :environment do
    Comment.destroy_all
    
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
        content: FFaker::BaconIpsum.sentence,
        user: User.all.sample
        )
      end
    end
    puts "have created fake comment"
    puts "now you have #{Comment.count} comment data"
  end
end