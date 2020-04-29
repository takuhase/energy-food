FactoryBot.define do
  factory :user do
    name { "Sazae" }
    email { "sazae@example.com" }
    password { "password" }
    password_confirmation { "password" }

    initialize_with do
      User.find_or_initialize_by(
        name: "Sazae",
        email: "sazae@example.com"
        # password: "password",
        # password_confirmation: "password"
      )
    end
  end
end
