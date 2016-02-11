class Admin::ServicesController < Admin::BaseController
  before_action :set_service, only: [:show, :edit, :update, :destroy, :upload_files]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # GET /services/new
  def new
    @service = Service.new
  end

  # GET /services/1/edit
  def edit
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @service] }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    if @service.update(service_params)
      redirect_to @service, notice: 'Обновлено'
    else
      render :edit
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to admin_services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  protected
  def gon_page_options
    # locals: { owner_klass: Service.model_name, owner_id: @service.id, assoc: 'images' }

    h = {
      page: 'service'
    }

    h[:id] if @service

    h
  end

  private
  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params[:service].permit(:title, :short_desc, :description, :price, :vendor_id, category_ids: [], place_attributes: [:id, :address, :city_id, :_destroy])
  end
end
