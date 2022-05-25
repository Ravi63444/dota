class HerosController < ApplicationController
  before_action :set_hero, only: %i[ show edit update destroy ]

  def home
  end
  def about
  end
  # GET /heros or /heros.json
  def index
    @heros = Hero.all
  end

  # GET /heros/1 or /heros/1.json
  def show
    # debugger
    @hero = set_hero
  end

  # GET /heros/new
  def new
    @hero = Hero.new
  end

  # GET /heros/1/edit
  def edit
    @hero = set_hero
  end

  # POST /heros or /heros.json
  def create
    @hero = Hero.new(hero_params)
      if @hero.save
           flash[:notice]= "Hero was successfully created."
      redirect_to hero_path(@hero)
      else
        render 'new'
      end
  end

  # PATCH/PUT /heros/1 or /heros/1.json
  def update
    @hero = set_hero
    if @hero.update(hero_params)
      redirect_to hero_path(@hero)
    else
      render 'edit'
    end
  end

  # DELETE /heros/1 or /heros/1.json
  def destroy
    
    @hero = set_hero
    @hero.destroy
    redirect_to heros_url, status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hero
      @hero = Hero.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hero_params
      params.require(:hero).permit(:name, :category)
    end
end
