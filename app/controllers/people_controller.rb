class PeopleController < ApplicationController

  def index
    @people = Person.all
    @records=Record.all
    @organization = current_user.organization
  end

  def new
    @person= Person.new
    @record = @person.records.build
    @organization = current_user.organization
  end

  def create
    @organization=current_user.organization
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
    #  Rails.logger.info @person.records
    #  Rails.logger.info @person.records.count
    if @person.records.count == 0
      @record= @person.records.build
    end
    @organization=current_user.organization
    render :new
  end

  def update
    @person= Person.find(params[:id])
    if @person.update(person_params)
      redirect_to @person
    else
      render :action => 'edit'
    end
  end

  def show
    @person= Person.find(params[:id])
    @people= Person.all
    @records = Record.all
    @organization=current_user.organization
  end

  private

  def person_params
  params.require(:person).permit(:first_name, :last_name, :gender, :photo, records_attributes:[:id, :first_active_year, :last_active_year, :hall_of_fame, :all_state_1st_team,:all_state_2nd_team, :all_state_3rd_team, :induction_year, :sport, :bio])
  end

end
