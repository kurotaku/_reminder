# == Schema Information
#
# Table name: reminders
#
#  id           :bigint           not null, primary key
#  content      :text(65535)
#  scheduled_at :datetime
#  send_at      :datetime
#  send_status  :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  booking_id   :bigint           not null
#  receiver_id  :bigint           not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_reminders_on_booking_id   (booking_id)
#  index_reminders_on_receiver_id  (receiver_id)
#  index_reminders_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (booking_id => bookings.id)
#  fk_rails_...  (receiver_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Reminder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
