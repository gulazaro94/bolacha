# encoding: utf-8

class ItemPictureUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [230, 230]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
