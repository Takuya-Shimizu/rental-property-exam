class PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]

  def index
    @properties = Property.all
  end

  def show
  end

  def new
    @property = Property.new
    2.times { @property.nearest_stations.build }
  end

  def edit
    @property.nearest_stations.build
  end

  def create
    @property = Property.new(property_params)
    if params[:back]
      render :new
    else
      respond_to do |format|
        if @property.save
          format.html { redirect_to @property, notice: "物件情報を登録しました！" }
          format.json { render :show, status: :created, location: @property }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @property.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def confirm
    @property = Property.new(property_params)
    render :new if @property.invalid?
  end

  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: "物件情報を編集しました！" }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: "物件情報を削除しました！" }
      format.json { head :no_content }
    end
  end

  private
    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:property_name, :rent, :address, :the_age_of_the_building, :remarks, nearest_stations_attributes: [:id, :line, :station, :on_foot])
    end
end
