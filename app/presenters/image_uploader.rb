class ImageUploader
  attr_reader :association, :owner

  def initialize(association)
    @owner = association.proxy_association.owner
    @association = association
  end

  def to_json
    { files: association.map(&:to_jq_upload) }
  end

  def add_images(images)
    uploaded_images = images.map do |file|
      association.build(image: file)
    end

    owner.save!

    { files: uploaded_images.map(&:to_jq_upload) }
  end

  def remove_files(images)

  end
end
