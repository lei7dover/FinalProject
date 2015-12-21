class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
    @organization= current_user.organization
    @people = Person.all
  end

  def show
    @organization= Organization.find(params[:id])
    @organizations= Organization.all
  end

  def new
    @organization=Organization.new
  end

  def create
    @organization=Organization.new(organization_params)
    if @organization.save
      redirect_to @organization

    end
  end

  private

  def organization_params
  params.require(:organization).permit(:logo, :street, :city, :state, :zip, :name, :phone_number, :org_photo)
  end

end
