class OrganizationsController < ApplicationController
  before_action :require_user, only: [:new,:create, :edit, :update, :destroy]


  def index
    @organizations = Organization.all
    if current_user
       if current_user.organization
          @organization = Organization.find_by user_id: @current_user.id
          render :show
       end
    end
    #if @organization == nil
      Rails.logger.info "organization.nil"
      #@organization = Organization.new
    #end
    #if current_user
    #  @organization= current_user.organization
      #Rails.logger.info current_user
    #else
      #@organization= Organization.new
    #end
    @people = Person.all
  end

  def show
    #if @organization == nil
      #@organization = Organization.new
    #end
      #if current_user
      #@organization= current_user.organization
      #else
      #@organization= Organization.new
      #end
      if current_user
    @organization= Organization.find_by user_id: @current_user.id
      else
        @organization = Organization.find(params[:id])
      end
    @people = Person.all
    #@organizations= Organization.all
  end

  def new
    @organization=Organization.new
  end

  def create
    @organization=Organization.new(organization_params)
    #@organization = current_user.organization
    @organization.user_id = current_user.id
    if @organization.save
    #
      redirect_to @organization
    end
  end

  def edit
    @organization= Organization.find_by user_id: @current_user.id
    render :new
  end

  def update
    @organization= Organization.find(params[:id])
    if @organization.update(organization_params)
      redirect_to @organization
    else
      render :action => 'edit'
    end
  end

  private
  def set_org
    @organization=Organization.find(params[:id])
  end

  def organization_params
  params.require(:organization).permit(:logo, :street, :city, :state, :zip, :name, :phone_number, :org_photo)
  end

end
