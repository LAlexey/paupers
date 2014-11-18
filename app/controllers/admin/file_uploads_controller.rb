class Admin::FileUploadsController < Admin::BaseController

  # owner_klass
  # owner_id
  # assoc
  def upload_files
    record = owner_klass.find(params[:owner_id])
    uploader = ImageUploader.new(record.method(assoc).call)

    render json: request.post? ? uploader.add_images(params[:files]) : uploader.to_json
  end

  # file_klass
  # file_id
  def destroy_file
    file_klass.find(params[:file_id]).destroy
    render nothing: true
  end

  protected

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
