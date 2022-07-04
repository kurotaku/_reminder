# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  ##########################
  # ユーザー
  ##########################
  p '=== User ==='

  users = [
    {name: '山田太郎', account_id: 'tyamada',email: ENV.fetch('DEMO_USER_EMAIL', 'test@test.com')},
    {name: 'テストユーザーA', account_id: 'usera',email: 'test_a@test.com'},
    {name: 'テストユーザーB', account_id: 'userb',email: 'test_b@test.com'},
    {name: 'テストユーザーC', account_id: 'userc',email: 'test_c@test.com'},
    {name: 'テストユーザーD', account_id: 'userd',email: 'test_d@test.com'},
    {name: 'テストユーザーE', account_id: 'usere',email: 'test_e@test.com'},
  ]

  users.each do |user|
    user = User.find_or_initialize_by(user)
    user.password = 'password'
    user.skip_confirmation!
    user.save!
  end

  test_user = User.find_by(name: '山田太郎')

  ##########################
  # フォロー
  ##########################
  p '=== Relationship ==='

  relationships = [
    {user: User.find_by(name: 'テストユーザーA'), follow: test_user},
    {user: User.find_by(name: 'テストユーザーB'), follow: test_user},
    {user: User.find_by(name: 'テストユーザーC'), follow: test_user},
    {user: User.find_by(name: 'テストユーザーD'), follow: test_user},
    {user: User.find_by(name: 'テストユーザーE'), follow: test_user},
  ]

  relationships.each do |relationship|
    object = Relationship.find_or_initialize_by(relationship)
    object.save!
  end

  ##########################
  # 予約
  ##########################
  p '=== Booking ==='

  time = Time.zone.now
  time = time.change(hour: 14, minute: 0)

  users = User.all.reject{|user| user == test_user}

  30.times do |i|
    Booking.create!(user: test_user, holder: users[rand(users.count)], start_at: time + i.day)
  end
end
