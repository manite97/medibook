class HospitalDirectory < ApplicationRecord
  # Basic model for records imported from hospital_directory.csv

  # If you want, add validations here. Keeping minimal for import reliability.
  validates :hospital_name, presence: true, allow_blank: true
  
  scope :by_state, ->(state) { where(state: )}
  scope :by_district, ->(district) { where(district: district) } 

  # A helper to return GPS coordinates as [lat, lng] if available
  def coordinates
    return nil if location_coordinates.blank?
    parts = location_coordinates.split(/[ ,]+/).map(&:strip).reject(&:blank?)
    # CSV shows values like "11.6357989, 92.7120575"
    if parts.size >= 2
      lat = Float(parts[0]) rescue nil
      lng = Float(parts[1]) rescue nil
      [lat, lng]
    else
      nil
    end
  end
end
