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
class ProcessAssignment < ApplicationRecord

  belongs_to :user
  belongs_to :process, class_name: "UserProcess", foreign_key: "user_process_id"

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :process_assignments, partial: "process_assignments/index", locals: { process_assignment: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :process_assignments, target: dom_id(self, :index) }
end
