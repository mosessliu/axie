# == Schema Information
#
# Table name: slp_logs
#
#  id         :integer          not null, primary key
#  total      :integer          not null
#  scholar_id :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class SlpLog < ApplicationRecord
  belongs_to :scholar
end
