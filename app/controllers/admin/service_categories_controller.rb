class Admin::ServiceCategoriesController < Admin::BaseController
  before_action :set_service_category, only: [:show, :edit, :update, :destroy]

  # GET /service_categories
  # GET /service_categories.json
  def index
    @service_categories = ServiceCategory.all
  end

  # GET /service_categories/1
  # GET /service_categories/1.json
  def show
  end

  # GET /service_categories/new
  def new
    @service_category = ServiceCategory.new
  end

  # GET /service_categories/1/edit
  def edit
  end

  # POST /service_categories
  # POST /service_categories.json
  def create
    @service_category = ServiceCategory.new(service_category_params)

    respond_to do |format|
      if @service_category.save
        format.html { redirect_to [:admin, @service_category], notice: 'Service category was successfully created.' }
        format.json { render :show, status: :created, location: [:admin, @service_category] }
      else
        format.html { render :new }
        format.json { render json: @service_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_categories/1
  # PATCH/PUT /service_categories/1.json
  def update
    respond_to do |format|
      if @service_category.update(service_category_params)
        format.html { redirect_to [:admin, @service_category], notice: 'Service category was successfully updated.' }
        format.json { render :show, status: :ok, location: [:admin, @service_category] }
      else
        format.html { render :edit }
        format.json { render json: @service_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_categories/1
  # DELETE /service_categories/1.json
  def destroy
    @service_category.destroy
    respond_to do |format|
      format.html { redirect_to admin_service_categories_url, notice: 'Service category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  include TheSortableTreeController::DefineVariablesMethod
  def rebuild
    id        = params[:id].to_i
    parent_id = params[:parent_id].to_i
    prev_id   = params[:prev_id].to_i
    next_id   = params[:next_id].to_i

    return render(nothing: true, status: :no_content) if parent_id.zero? && prev_id.zero? && next_id.zero?

    item, collection, klass = self.the_define_common_variables
    item = self.instance_variable_set(item, klass.find(id))

    if prev_id.zero? && next_id.zero?
      item.update_attribute(:parent_id, parent_id)
    else
      parent_id = nil if parent_id.zero?
      item.update_attribute(:parent_id, parent_id)

      i = 0
      siblings = item.siblings.order(:position)

      ServiceCategory.transaction do
        if !prev_id.zero?
          siblings.each do |sibling|
            sibling.update_column(:position, i)
            item.update_column(:position, i += 1) if sibling.id == prev_id

            i += 1
          end
        elsif !next_id.zero?
          siblings.each do |sibling|
            item.update_column(:position, i += 1) if sibling.id == next_id
            sibling.update_column(:position, i)

            i += 1
          end
        end
      end
    end

    render(nothing: true, status: :ok)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_category
      @service_category = ServiceCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_category_params
      params[:service_category].permit(:title, :permalink)
    end
end
