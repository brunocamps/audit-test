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
require "test_helper"

class EvaluationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
