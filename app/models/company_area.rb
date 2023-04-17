# == Schema Information
#
# Table name: company_areas
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CompanyArea < ApplicationRecord
  has_many :users
  has_many :evaluations
  
  def total_verification_grades
    evaluations.joins(:verifications).sum(:grade)
  end

  

  def total_product
    UserProcess.where(company_area: self).sum(:product)
  end

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :company_areas, partial: "company_areas/index", locals: { company_area: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :company_areas, target: dom_id(self, :index) }
end
