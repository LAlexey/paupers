class ImageUploader
  class Image
    attr_accessor :file, :title

    def initialize(file, title)
      @file = file
      @title = title
    end
  end

  attr_reader :association, :owner

  def initialize(association)
    @owner = association.proxy_association.owner
    @association = association
  end

  def to_json
    { files: association.map(&:to_jq_upload) }
  end

  def add_image(image)
    uploaded_image = association.build(image: image.file, title: image.title)
    owner.save!

    { files: [uploaded_image.to_jq_upload] }
  end
end
