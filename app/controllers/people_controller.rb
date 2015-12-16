class PeopleController < ApplicationController
  def new
    @person= Person.new
  end

  def create
    @person=Person.new(person_params)
    if @person.save!
      redirect_to @person
    else
      render :action => 'new'
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
    @person= Person.params(:person_id)
  end

  private

  def person_params
  params.require(:person).permit(:first_name, :last_name, :gender, :photo)
  end
end
