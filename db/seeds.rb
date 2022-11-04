require 'faker'

City.destroy_all
#Tag.destroy_all
User.destroy_all
Gossip.destroy_all
#Gossiptag.destroy_all
#PrivateMessage.destroy_all
Like.destroy_all

10.times do |t|
    city = City.create!(name: Faker::Address.city, zip_code: Faker::Address.zip_code,)
end

# 10.times do |t|
#     title = Faker::Emotion.noun.downcase
#     title.gsub!(/\s+/, '-')
#     Tag.create(
#     title: title,
#     )
#   end

50.times do |t|
    user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, email: Faker::Internet.email, age:  Faker::Number.between(from: 0, to: 100), city: City.all.sample, password: "123456")
end

25.times do |t|
    gossip = Gossip.create!(title: Faker::Movie.title[0..11], content: Faker::Quote.matz, user: User.all.sample)
    rand(1..3).times do |t|
        coms = ["LOL", ":)", "WTF!", ":/", "ou pas ...", "report", "bof", "non", "cmb"]
        comment = Comment.create!(content: coms.sample, user: User.all.sample, gossip: gossip)
    end
end

200.times do |t|
    like = Like.create!(user: User.all.sample, gossip: Gossip.all.sample)
end

# 10.times do |t|
#     Gossiptag.create(tag: Tag.all.sample, gossip: Gossip.all.sample,)
# end

# 15.times do |t|
#     PrivateMessage.create(recipient: User.all.sample, sender: User.all.sample, content: Faker::Lorem.sentences,)
# end 