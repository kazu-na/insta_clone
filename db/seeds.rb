User.create!(name:      "Example",
             username:  "Example User",
             email:     "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:      "りんご",
             username:  "apple",
             email:     "apple@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:      "みかん",
             username:  "orange",
             email:     "orange@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:      "ねこ",
             username:  "cat",
             email:     "cat@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:      "いぬ",
             username:  "dog",
             email:     "dog@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)
