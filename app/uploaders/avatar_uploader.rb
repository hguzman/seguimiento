class AvatarUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  process resize_to_fill: [800, 800]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb, :if => :image? do
    process resize_to_fill: [136, 136]
  end

# version :profile, :if => :image? do
#  process resize_to_fill: [50, 50]
# end


  def extension_whitelist
    %w(jpg jpeg png)
  end

  protected

  def image?(new_file)
    new_file.content_type.start_with? 'image'
  end

end
