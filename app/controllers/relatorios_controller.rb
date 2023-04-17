class RelatoriosController < ApplicationController
  before_action :set_relatorio, only: [:show, :edit, :update, :destroy]

  # Uncomment to enforce Pundit authorization
  # after_action :verify_authorized
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # GET /relatorios
  def index
    @pagy, @relatorios = pagy(Relatorio.sort_by_params(params[:sort], sort_direction))

    # Uncomment to authorize with Pundit
    # authorize @relatorios
  end

  # GET /relatorios/1 or /relatorios/1.json
  def show
  end

  # GET /relatorios/new
  def new
    @relatorio = Relatorio.new

    # Uncomment to authorize with Pundit
    # authorize @relatorio
  end

  # GET /relatorios/1/edit
  def edit
  end

  # POST /relatorios or /relatorios.json
  def create
    @relatorio = Relatorio.new(relatorio_params)

    # Uncomment to authorize with Pundit
    # authorize @relatorio

    respond_to do |format|
      if @relatorio.save
        format.html { redirect_to @relatorio, notice: "Relatorio was successfully created." }
        format.json { render :show, status: :created, location: @relatorio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @relatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relatorios/1 or /relatorios/1.json
  def update
    respond_to do |format|
      if @relatorio.update(relatorio_params)
        format.html { redirect_to @relatorio, notice: "Relatorio was successfully updated." }
        format.json { render :show, status: :ok, location: @relatorio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @relatorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relatorios/1 or /relatorios/1.json
  def destroy
    @relatorio.destroy
    respond_to do |format|
      format.html { redirect_to relatorios_url, notice: "Relatorio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_relatorio
    @relatorio = Relatorio.find(params[:id])

    # Uncomment to authorize with Pundit
    # authorize @relatorio
  rescue ActiveRecord::RecordNotFound
    redirect_to relatorios_path
  end

  # Only allow a list of trusted parameters through.
  def relatorio_params
    params.fetch(:relatorio, {})

    # Uncomment to use Pundit permitted attributes
    # params.require(:relatorio).permit(policy(@relatorio).permitted_attributes)
  end
end
