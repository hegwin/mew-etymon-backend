class EtymonsController < ApplicationController
  before_action :set_etymon, only: [:show, :edit, :update, :destroy]

  # GET /etymons
  # GET /etymons.json
  def index
    @etymons = Etymon.all
  end

  # GET /etymons/1
  # GET /etymons/1.json
  def show
  end

  # GET /etymons/new
  def new
    @etymon = Etymon.new
  end

  # GET /etymons/1/edit
  def edit
  end

  # POST /etymons
  # POST /etymons.json
  def create
    @etymon = Etymon.new(etymon_params)

    respond_to do |format|
      if @etymon.save
        format.html { redirect_to @etymon, notice: 'Etymon was successfully created.' }
        format.json { render :show, status: :created, location: @etymon }
      else
        format.html { render :new }
        format.json { render json: @etymon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /etymons/1
  # PATCH/PUT /etymons/1.json
  def update
    respond_to do |format|
      if @etymon.update(etymon_params)
        format.html { redirect_to @etymon, notice: 'Etymon was successfully updated.' }
        format.json { render :show, status: :ok, location: @etymon }
      else
        format.html { render :edit }
        format.json { render json: @etymon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etymons/1
  # DELETE /etymons/1.json
  def destroy
    @etymon.destroy
    respond_to do |format|
      format.html { redirect_to etymons_url, notice: 'Etymon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_etymon
      @etymon = Etymon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def etymon_params
      params.require(:etymon).permit(:spelling, :meaning, :source, :evolution)
    end
end
