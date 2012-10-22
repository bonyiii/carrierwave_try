class Bwimage < ActiveRecord::Base
  attr_accessible :title, :photo, :photo_cache, :filename, :original_filename, :remote_photo_url, :url

  attr_accessor :original_filename
  mount_uploader :photo, PhotoUploader

  after_create :process_photo

  # http://code.dblock.org/carrierwave-delayjob-processing-of-selected-versions
  def recreate_delayed_versions!
    photo.is_processing_delayed = true
    photo.recreate_versions!
  end

  def process_photo
    if url.present?
      Resque.enqueue(BwimageTask::Remote, id, url)
    else
      Resque.enqueue(BwimageTask::Local, id)
    end
  end

end
