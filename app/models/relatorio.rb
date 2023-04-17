# == Schema Information
#
# Table name: relatorios
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Relatorio < ApplicationRecord

  # Broadcast changes in realtime with Hotwire
  after_create_commit  -> { broadcast_prepend_later_to :relatorios, partial: "relatorios/index", locals: { relatorio: self } }
  after_update_commit  -> { broadcast_replace_later_to self }
  after_destroy_commit -> { broadcast_remove_to :relatorios, target: dom_id(self, :index) }
end
