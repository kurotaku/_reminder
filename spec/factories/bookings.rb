# == Schema Information
#
# Table name: bookings
#
#  id         :bigint           not null, primary key
#  start_at   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  holder_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_bookings_on_holder_id  (holder_id)
#  index_bookings_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (holder_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :booking do
    user { nil }
    holder { nil }
    start_at { "2022-07-04 10:58:14" }
  end
end
