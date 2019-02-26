Affiliation.create!(university: "わせだ",
                    department: "しょう",
                    course: "なし",
                    labo: "井上",
                    cord: "11111111")

10.times do |n|
    university = Faker::University.name
    department ="しょう#{n+1}@"
    course = "なし"
    labo = Faker::JapaneseMedia::DragonBall.character
    cord = "hogehoge#{n+1}"
    Affiliation.create!(university: university,
                        department: department,
                        course: course,
                        labo: labo,
                        cord: cord)
end

User.create!(email: "researchable0214@gmail.com",
                    first_name: "太郎",
                    last_name: "管理者",
                    affiliation: Affiliation.find(1),
                    avatar: Faker::Avatar.image,
                    admin: 1,
                    password: "111111",
                    password_confirmation: "111111")
100.times do |n|
    first_name  = Faker::Name.name
    last_name = "たけだ"
    affiliation = Affiliation.find(n%10 + 1)
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(first_name:  first_name,
                last_name: last_name,
                email: email,
                affiliation: affiliation,
                avatar: "",
                admin: false,
                password: password,
                password_confirmation: password)
end

10.times do |n|
    c = Faker::Music::RockBand.name
    Category.create!(category_name: c)
end

40.times do |n|
    affiliation = Affiliation.find(1)
    user = User.find(n%5 + 1)
    status = n%3
    parent_id = n + 1
    category = Category.find(rand(1..10))
    title = Faker::Movies::HarryPotter.character
    Protocol.create!(affiliation: affiliation,
                    user: user,
                    status: status,
                    parent_id: parent_id,
                    category: category,
                    title: title)
end

Protocol.create!(affiliation: Affiliation.find(1),
                user: User.find(1),
                status: 0,
                parent_id: 0,
                category: Category.find(rand(1..10)),
                title: Faker::Movies::HarryPotter.character)

70.times do |n|
    protocol = Protocol.find(rand(1..40))
    text = Faker::Quotes::Shakespeare.hamlet_quote
    position = n + 1
    Procedure.create!(protocol: protocol,
                        text: text,
                        position: position)
end

100.times do |n|
    t = Faker::JapaneseMedia::OnePiece.akuma_no_mi
    d = Faker::Date.between(2.days.ago, Date.today)
    o = Faker::Movies::StarWars.wookiee_sentence + ",,," + Faker::Movies::StarWars.wookiee_sentence
    r = Faker::Movies::StarWars.wookiee_sentence + ",,," + Faker::Movies::StarWars.wookiee_sentence
    pro = Protocol.find(n%10 + 1)
    u = User.find(n%20 + 1)
    c = Category.find(n%10 + 1)
    i = Faker::Avatar.image("my-own-slug", "50x50", "jpg")
    Experiment.create!(title: t,
                        date: d,
                        overview: o,
                        result: r,
                        protocol: pro,
                        user: u,
                        category: c,
                        image: i)
end


100.times do |n|
    e = Experiment.find(n%50 + 1)
    u = User.find(n%30 + 1)
    c = Faker::Quote.famous_last_words + Faker::Quote.famous_last_words + Faker::Quote.famous_last_words
    Comment.create!(experiment: e,
                    user: u,
                    comment: c)
end
        