class NotariesController < ApplicationController
  before_action :set_notary, only: %i[ show edit update destroy ]

  # GET /notaries or /notaries.json
  def index
    @notaries = Notary.all
  end

  # GET /notaries/1 or /notaries/1.json
  def show
  end

  # GET /notaries/new
  def new
    @notary = Notary.new
  end

  # GET /notaries/1/edit
  def edit
  end

  # POST /notaries or /notaries.json
  def create
    @notary = Notary.new(notary_params)

    respond_to do |format|
      if @notary.save
        format.html { redirect_to @notary, notice: "Notary was successfully created." }
        format.json { render :show, status: :created, location: @notary }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notaries/1 or /notaries/1.json
  def update
    respond_to do |format|
      if @notary.update(notary_params)
        format.html { redirect_to @notary, notice: "Notary was successfully updated." }
        format.json { render :show, status: :ok, location: @notary }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notaries/1 or /notaries/1.json
  def destroy
    @notary.destroy!

    respond_to do |format|
      format.html { redirect_to notaries_path, status: :see_other, notice: "Notary was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notary
      @notary = Notary.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notary_params
      params.fetch(:notary, {})
    end
end
