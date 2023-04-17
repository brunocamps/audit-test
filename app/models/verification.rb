# == Schema Information
#
# Table name: verifications
#
#  id              :bigint           not null, primary key
#  deadline        :string
#  goal            :string
#  grade           :float
#  last_updated_by :string
#  name            :string
#  observations    :string
#  punctuation     :float
#  weight          :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  evaluation_id   :bigint           not null
#
# Indexes
#
#  index_verifications_on_evaluation_id  (evaluation_id)
#
# Foreign Keys
#
#  fk_rails_...  (evaluation_id => evaluations.id)
#
class Verification < ApplicationRecord
  belongs_to :evaluation

  def total_verification_grades
    evaluations.joins(:verifications).sum(:grade)
  end

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :verifications, partial: "verifications/index", locals: { verification: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :verifications, target: dom_id(self, :index) }
end
