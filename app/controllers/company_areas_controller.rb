class CompanyAreasController < ApplicationController

  before_action :authenticate_user!

  before_action :set_company_area, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /company_areas
  def index
    @pagy, @company_areas = pagy(CompanyArea.sort_by_params(params[:sort], sort_direction))

    @data = Evaluation.joins(:verifications, :company_area)
                  .group("company_areas.name")
                  .sum("verifications.punctuation")
                  .transform_keys(&:titleize)

    

    # Uncomment to authorize with Pundit
    # authorize @company_areas

    @company_areas_with_sum = @company_areas.map do |area|
      {
        area: area,
        sum: area.evaluations.joins(:verifications).sum("verifications.punctuation")
      }
    end
  end

  # GET /company_areas/1 or /company_areas/1.json
  def show
    @company_area = CompanyArea.find(params[:id])
    @evaluations = @company_area.evaluations
  end

  # GET /company_areas/new
  def new
    @company_area = CompanyArea.new

    # Uncomment to authorize with Pundit
    # authorize @company_area
  end

  # GET /company_areas/1/edit
  def edit
  end

  # POST /company_areas or /company_areas.json
  def create
    @company_area = CompanyArea.new(company_area_params)

    # Uncomment to authorize with Pundit
    # authorize @company_area

    respond_to do |format|
      if @company_area.save
        format.html { redirect_to @company_area, notice: "Company area was successfully created." }
        format.json { render :show, status: :created, location: @company_area }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_areas/1 or /company_areas/1.json
  def update
    respond_to do |format|
      if @company_area.update(company_area_params)
        format.html { redirect_to @company_area, notice: "Company area was successfully updated." }
        format.json { render :show, status: :ok, location: @company_area }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company_area.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_areas/1 or /company_areas/1.json
  def destroy
    @company_area.destroy
    respond_to do |format|
      format.html { redirect_to company_areas_url, notice: "Company area was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company_area
    @company_area = CompanyArea.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @company_area
  rescue ActiveRecord::RecordNotFound
    redirect_to company_areas_path
  end

  # Only allow a list of trusted parameters through.
  def company_area_params
    params.require(:company_area).permit(:name)

    # Uncomment to use Pundit permitted attributes
    # params.require(:company_area).permit(policy(@company_area).permitted_attributes)
  end
end
