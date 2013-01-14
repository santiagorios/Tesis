FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@espe.edu.ec" }
    password "secret"
    password_confirmation "secret"
    crypted_password Sorcery::CryptoProviders::BCrypt.encrypt("secret", "asdasdastr4325234324sdfds")
    salt "asdasdastr4325234324sdfds"
    activation_state "active"
  end

  factory :program do
    sequence :title do |n|
      "Program #{n}"
    end
    description "This is a long text"
    program_type
  end

  factory :program_type do
    sequence :name do |n|
      "Program Type #{n}"
    end
  end

  factory :project do
    sequence(:title) { |n| "Project #{n}" }
    description "This is a long text"
    user
    program
  end

  factory :result do
    sequence(:title) { |n| "Result #{n}" }
    description "This is a long text"
    user
    project
    result_type
  end

  factory :result_type do
    sequence :name do |n|
      "Program Type #{n}"
    end
  end

  factory :entry do
    sequence(:title) { |n| "Entry #{n}" }
    body "This is a long text"
    user
    program
  end
end

