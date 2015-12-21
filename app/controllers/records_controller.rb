class RecordsController < ApplicationController
  def new
    @record= Record.new
  end

  def create
    @record=Record.new(record_params)
    @record.save
  end

  def show
  end

  private

  def record_params
  params.require(:record).permit(:first_active_year, :last_active_year, :hall_of_fame, :all_state_1st_team,:all_state_2nd_team, :all_state_3rd_team, :induction_year, :bio)
  end

end
