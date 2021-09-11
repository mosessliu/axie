# == Schema Information
#
# Table name: scholars
#
#  id              :integer          not null, primary key
#  discord_name    :string
#  ronin_wallet_id :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Scholar < ApplicationRecord
  has_many :slp_logs
end
