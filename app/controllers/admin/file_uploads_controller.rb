class Admin::FileUploadsController < Admin::BaseController

  # owner_klass
  # owner_id
  # assoc
  def upload_files
    record = owner_klass.find(params[:owner_id])
    uploader = ImageUploader.new(record.method(assoc).call)

    if request.post?
      uploaded_image = ImageUploader::Image.new(params[:files].first, params[:title])
      render json: uploader.add_image(uploaded_image)
    else
      render json: uploader.to_json
    end
  end

  def update_position
    model = params[:item][:klass].constantize
    item = model.find(params[:item][:id])
    item.position_position = params[:item][:position]
    item.save!

    render(nothing: true)
  end

  # file_klass
  # file_id
  def destroy_file
    file_record.destroy
    render nothing: true
  end

  def update_file
    file_record.update_attribute(:title, params[:title])

    render nothing: true
  end

  protected

  def file_record
    @image ||= file_klass.find(params[:file_id])
  end

  def owner_klass
    @owner_klass ||= begin
      raise ArgumentError.new('owner_klass') unless params[:owner_klass].in?(AVAILABLE_UPLOADS.keys)
      params[:owner_klass].constantize
    end
  end

  def assoc
    @assoc ||= begin
      raise ArgumentError.new('assoc') unless params[:assoc].in?(AVAILABLE_UPLOADS[owner_klass.model_name])
      params[:assoc]
    end
  end

  AVAILABLE_UPLOADS = {
    Service.model_name => ['images']
  }

  def file_klass
    @file_klass ||= begin
      raise ArgumentError.new('file_klass') unless params[:file_klass].in?([ServiceImage.model_name])
      params[:file_klass].constantize
    end
  end
end
