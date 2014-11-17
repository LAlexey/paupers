class ImageUploader
  attr_reader :association, :owner

  def initialize(association)
    @owner = association.proxy_association.owner
    @association = association
  end

  def to_json
    { files: association.map(&:to_jq_upload) }
  end

  def add_files(images)
    images.each do |file|
      association.build(image: file)
    end

    owner.save!
  end

  def remove_files(images)

  end
end
