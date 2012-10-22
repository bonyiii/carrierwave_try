class Bwimage < ActiveRecord::Base
  attr_accessible :title, :photo, :photo_cache, :filename, :original_filename

  attr_accessor :original_filename
  mount_uploader :photo, PhotoUploader

  # http://code.dblock.org/carrierwave-delayjob-processing-of-selected-versions
  def recreate_delayed_versions!
    photo.is_processing_delayed = true
    photo.recreate_versions!
  end

end
