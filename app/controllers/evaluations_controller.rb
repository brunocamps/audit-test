class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /evaluations
  def index
    @pagy, @evaluations = pagy(Evaluation.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @evaluations
  end

  # GET /evaluations/1 or /evaluations/1.json
  def show
    @evaluation = Evaluation.find(params[:id])
    @verifications = @evaluation.verifications
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new

    # Uncomment to authorize with Pundit
    # authorize @evaluation
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations or /evaluations.json
  def create
    @evaluation = Evaluation.new(evaluation_params)

    # Uncomment to authorize with Pundit
    # authorize @evaluation

    respond_to do |format|
      if @evaluation.save
        format.html { redirect_to @evaluation, notice: "Evaluation was successfully created." }
        format.json { render :show, status: :created, location: @evaluation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluations/1 or /evaluations/1.json
  def update
    respond_to do |format|
      if @evaluation.update(evaluation_params)
        format.html { redirect_to @evaluation, notice: "Evaluation was successfully updated." }
        format.json { render :show, status: :ok, location: @evaluation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1 or /evaluations/1.json
  def destroy
    @evaluation.destroy
    respond_to do |format|
      format.html { redirect_to evaluations_url, notice: "Evaluation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation
    @evaluation = Evaluation.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @evaluation
  rescue ActiveRecord::RecordNotFound
    redirect_to evaluations_path
  end

  # Only allow a list of trusted parameters through.
  def evaluation_params
    params.require(:evaluation).permit(:name, :company_area_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:evaluation).permit(policy(@evaluation).permitted_attributes)
  end
end
