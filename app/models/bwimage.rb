class Bwimage < ActiveRecord::Base
  attr_accessible :name, :avatar, :avatar_cache

  mount_uploader :avatar, AvatarUploader

  # http://code.dblock.org/carrierwave-delayjob-processing-of-selected-versions
  def recreate_delayed_versions!
    avatar.is_processing_delayed = true
    avatar.recreate_versions!
  end

end
