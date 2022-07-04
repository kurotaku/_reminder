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
class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :holder, class_name: 'User'
end
