# frozen_string_literal: true

class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true # Force version generation at upload time.

  process convert: 'jpg'

  version :thumbnail do
    resize_to_fit 256, 256
    def default_url
      'la_fin_url_dune_image_par_defaut_sur_cloudinary'
    end
  end
  def default_url(*_args)
    'la_fin_url_dune_image_par_defaut_sur_cloudinary'
  end
end
