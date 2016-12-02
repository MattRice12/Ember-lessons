class MonstersController < ApplicationController
  def index
    render json: Monster.all
  end

  def update
    @monster = Monster.find(params[:id])
    @monster.update_attributes(monster_params)
    render json: @monster
  end

  private
  def monster_params
    params.require(:monster).permit(:active)
  end
end
