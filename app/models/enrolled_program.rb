# == Schema Information
#
# Table name: enrolled_programs
#
#  id         :bigint           not null, primary key
#  status     :string
#  user_id    :bigint           not null
#  program_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EnrolledProgram < ApplicationRecord
  belongs_to :user
  belongs_to :program
end
