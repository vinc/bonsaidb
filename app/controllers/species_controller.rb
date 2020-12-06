class SpeciesController < ApplicationController
  before_action :set_species, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @species = Species.order(:name).all

    @botanical_group = params['botanical-group']&.underscore
    @species = @species.where(botanical_group: @botanical_group) if @botanical_group.present?
  end

  def show
  end

  def new
    @species = Species.new
    authorize @species
  end

  def edit
    authorize @species
  end

  def create
    @species = Species.new(species_params)
    authorize @species

    respond_to do |format|
      if @species.save
        format.html { redirect_to @species, notice: 'Species was successfully created.' }
        format.json { render :show, status: :created, location: @species }
      else
        format.html { render :new }
        format.json { render json: @species.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @species
    respond_to do |format|
      if @species.update(species_params)
        format.html { redirect_to @species, notice: 'Species was successfully updated.' }
        format.json { render :show, status: :ok, location: @species }
      else
        format.html { render :edit }
        format.json { render json: @species.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @species
    @species.destroy
    respond_to do |format|
      format.html { redirect_to species_index_url, notice: 'Species was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_species
    @species = Species.friendly.find(params[:id])
  end

  def species_params
    params.require(:species).permit(:name, :common_names, :botanical_group)
  end
end
