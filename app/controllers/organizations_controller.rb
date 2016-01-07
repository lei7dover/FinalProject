class OrganizationsController < ApplicationController
  before_action :require_user, only: [:new,:create, :edit, :update, :destroy]


  def index
    @organizations = Organization.all
    if current_user
       if current_user.organization
          @organization = current_user.organization
          render :show
       end
    end
    @people = Person.all
  end

  def show
      if current_user
        @organization= current_user.organization
      else
        @organization = Organization.friendly.find(params[:id])
      end
    @people = Person.all
  end

  def new
    @organization=Organization.new
  end

  def create
    @organization=current_user.organization.new(organization_params)

    @organization.user_id = current_user.id
    if @organization.save
      redirect_to @organization
    end
  end

  def edit
    @organization= current_user.organization
    render :new
  end

  def update
    @organization= current_user.organization
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
