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

  private
  
  def organization_params
  params.require(:organization).permit(:logo, :street, :city, :state, :zip, :name)
end

end
