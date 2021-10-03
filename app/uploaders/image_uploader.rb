# frozen_string_literal: true

require 'image_processing/mini_magick'

class ImageUploader < Shrine
  plugin :processing
  plugin :validation_helpers
  plugin :derivatives

  Attacher.validate do
    validate_extension_inclusion %w[jpg jpeg png].freeze
  end

  Attacher.derivatives do |original|
    magick = ImageProcessing::MiniMagick.source(original).convert('jpg')

    # the :original file should NOT be included anymore
    {
      large: magick.resize_to_fill!(800, 600),
      thumb: magick.resize_to_fill!(400, 300)
    }
  end
end
