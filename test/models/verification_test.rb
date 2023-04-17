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
require "test_helper"

class VerificationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
