class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
    if @organization == nil
      Rails.logger.info "organization.nil"
      @organization = Organization.new
    end
    if current_user
    #  @organization= current_user.organization
      Rails.logger.info current_user
    else
      @organization= Organization.new
    end
    @people = Person.all
  end

  def show
    if @organization == nil
      @organization = Organization.new
    end
      if current_user
      #@organization= current_user.organization
      else
      @organization= Organization.new
      end
    #@organization= Organization.find(params[:id])
    @organizations= Organization.all
  end

  def new
    @organization=Organization.new
  end

  def create
    @organization=Organization.new(organization_params)

    if @organization.save
    #  @organization=current_user.organization
      redirect_to @organization
    end
  end

  def edit
    @organization= Organization.find(params[:id])
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

  def organization_params
  params.require(:organization).permit(:logo, :street, :city, :state, :zip, :name, :phone_number, :org_photo)
  end

end
