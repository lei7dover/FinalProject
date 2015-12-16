class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def show
    @organization= Organization.find(organization_params)
  end

  def new
    @organization=Organization.new
  end

  def create
    @organization=Organization.new(organization_params)
    if @organization.save!
      redirect_to @organization
    else
      render :action => 'new'
    end
  end

  private

  def organization_params
  params.require(:organization).permit(:logo, :street, :city, :state, :zip, :name)
  end

end
