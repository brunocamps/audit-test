class VerificationsController < ApplicationController
  before_action :set_verification, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /verifications
  def index
    @pagy, @verifications = pagy(Verification.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @verifications
  end

  # GET /verifications/1 or /verifications/1.json
  def show
  end

  # GET /verifications/new
  def new
    @verification = Verification.new

    # Uncomment to authorize with Pundit
    # authorize @verification
  end

  # GET /verifications/1/edit
  def edit
  end

  # POST /verifications or /verifications.json
  def create
    @verification = Verification.new(verification_params)
    calculate_punctuation(@verification)

    # Uncomment to authorize with Pundit
    # authorize @verification

    respond_to do |format|
      if @verification.save
        format.html { redirect_to @verification, notice: "Verification was successfully created." }
        format.json { render :show, status: :created, location: @verification }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @verification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verifications/1 or /verifications/1.json
  def update
    calculate_punctuation(@verification)
    @verification.last_updated_by = current_user.name
    respond_to do |format|
      if @verification.update(verification_params)
        format.html { redirect_to @verification, notice: "Verification was successfully updated." }
        format.json { render :show, status: :ok, location: @verification }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @verification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verifications/1 or /verifications/1.json
  def destroy
    @verification.destroy
    respond_to do |format|
      format.html { redirect_to verifications_url, notice: "Verification was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_verification
    @verification = Verification.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @verification
  rescue ActiveRecord::RecordNotFound
    redirect_to verifications_path
  end

  # Only allow a list of trusted parameters through.
  def verification_params
    params.require(:verification).permit(:name, :goal, :deadline, :weight, :grade, :observations, :evaluation_id)

    # Uncomment to use Pundit permitted attributes
    # params.require(:verification).permit(policy(@verification).permitted_attributes)
  end

  def calculate_punctuation(verification)
    verification.punctuation = verification.grade * verification.weight
  end
end
