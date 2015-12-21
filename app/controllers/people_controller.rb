class PeopleController < ApplicationController

  def index
    @people = Person.all
  end
  
  def new
    @person= Person.new
    @record = @person.records.build
  end

  def create
    @person=Person.new(person_params)
    if @person.save
      redirect_to @person
    else
      respond_to do |format|
        format.html  { render :new }
        format.js {render 'errors'}
      end
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person= Person.find(params[:id])
    if @person.update(params[:person])
      redirect_to @person
    else
      render :action => 'edit'
    end
  end

  def show
    @person= Person.find(params[:id])
    @people= Person.all
    @records = Record.all
  end

  private

  def person_params
  params.require(:person).permit(:first_name, :last_name, :gender, :photo, records_attributes:[:id, :first_active_year, :last_active_year, :hall_of_fame, :all_state_1st_team,:all_state_2nd_team, :all_state_3rd_team, :induction_year, :sport, :bio])
  end

end
