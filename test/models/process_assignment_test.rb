# == Schema Information
#
# Table name: process_assignments
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#  user_process_id :bigint           not null
#
# Indexes
#
#  index_process_assignments_on_user_id          (user_id)
#  index_process_assignments_on_user_process_id  (user_process_id)
#
require "test_helper"

class ProcessAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
