class DocumentUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  def url
    return super if Rails.env.production? || file.nil?
    requested_path = "#{store_dir}/#{file.filename}"

    if Dir.glob("#{Rails.root}/public/#{requested_path}").any?
      "/#{requested_path}"
    else
      "https://dalp.online/#{requested_path}"
    end
  end

  def extension_whitelist
    %w(doc docb docm docx dot dotm dotx)
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) || model.instance_variable_set(var, SecureRandom.uuid)
  end
end
