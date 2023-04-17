# == Schema Information
#
# Table name: evaluations
#
#  id              :bigint           not null, primary key
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_area_id :bigint           not null
#
# Indexes
#
#  index_evaluations_on_company_area_id  (company_area_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_area_id => company_areas.id)
#
class Evaluation < ApplicationRecord
  belongs_to :company_area
  has_many :verifications

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :evaluations, partial: "evaluations/index", locals: { evaluation: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :evaluations, target: dom_id(self, :index) }
end
