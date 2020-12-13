class SpeciesController < ApplicationController
  before_action :set_species, only: [:show, :edit, :update, :destroy, :versions]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @species = Species.order(:botanical_name).page(params['page'])

    @filter = params['filter']&.underscore
    if Species.botanical_groups.keys.include? @filter
      @species = @species.where(botanical_group: @filter)
    elsif @filter == 'fruit_bearing'
      @species = @species.where(fruits: true)
    elsif @filter == 'flowering'
      @species = @species.where(flowers: true)
    else
      @filter = nil
    end
  end

  def show
    @species = @species.paper_trail.version_at(Time.at(params[:version].to_i + 1)) || @species if params[:version]
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

  def versions
    @versions = @species.versions
  end

  private

  def set_species
    @species = Species.friendly.find(params[:id])
  end

  def species_params
    params.require(:species).permit(%i[fruits flowers botanical_group botanical_name common_names] + Species.text_attributes)
  end
end
