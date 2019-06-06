# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  album_type :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  validates :title, :year, presence: true

  belongs_to :band,
    foreign_key: :band_id,
    class_name: :Band


end
