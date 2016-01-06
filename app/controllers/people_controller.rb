class PeopleController < ApplicationController
  before_action :require_user, only: [:new,:create, :edit, :update, :destroy]
  #before_filter :set_org, only: [:new, :create, :show, :edit, :update]
  has_scope :records_sport_filter
  has_scope :people_last_name_filter
  has_scope :people_class_of_filter
  has_scope :by_organization_filter, :as => :organization_id

  def index
    #@people = Person.all
    @records=Record.all
    #@organization = current_user.organization
    @organization = Organization.friendly.find(params[:organization_id])
    if params[:search]
      @people = @organization.people.search(params[:search]).order("created_at DESC")
    else
      #@people = Person.all.order('created_at DESC')
      @people = apply_scopes(Person).all.order('created_at DESC')
    end

  end

  def new
    if current_user
    @organization=current_user.organization
    else
    @organization = Organization.friendly.find(params[:organization_id])
    end
    @person= @organization.people.build
    @record = @person.records.build

  end

  def create
    if current_user
    @organization=current_user.organization
    else
    @organization = Organization.friendly.find(params[:organization_id])
    end
    @person=@organization.people.new(person_params)
    if @person.save!
      redirect_to organization_person_path(@organization, @person)
    else
      respond_to do |format|
        format.html  { render :new }
        format.js {render 'errors'}
      end
    end
  end

  def edit
    @person = Person.friendly.find(params[:id])
    #  Rails.logger.info @person.records
    #  Rails.logger.info @person.records.count
    if @person.records.count == 0
      @record= @person.records.build
    end
    @organization=current_user.organization
    render :new
  end

  def update
    if current_user
    @organization=current_user.organization
    else
    @organization = Organization.friendly.find(params[:organization_id])
    end
    @person= Person.friendly.find(params[:id])
    if @person.update(person_params)
      redirect_to organization_person_path(@organization, @person)
    else
      render :action => 'edit'
    end
  end

  def show
    if current_user
    @organization=current_user.organization
    else
    @organization = Organization.friendly.find(params[:organization_id])
    end
    @person= Person.friendly.find(params[:id])
    @people= Person.all
    @records = Record.all
  end

  def destroy
    @person= Person.friendly.find(params[:id])
    @person.destroy
    respond_to do |format|
      format.html { redirect_to organization_people_path, [:alert]=> 'Person was successfully destroyed.' }
    end
  end


  private

  #def set_org
  #  @organization=Organization.find(params[:id])
  #end

  def person_params
  params.require(:person).permit(:first_name, :last_name, :gender,:class_of, :photo, records_attributes:[:id, :first_active_year, :last_active_year, :hall_of_fame, :all_state_1st_team,:all_state_2nd_team, :all_state_3rd_team, :induction_year, :sport, :bio, :_destroy])
  end

end
