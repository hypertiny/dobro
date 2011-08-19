class Dobro::ApplicationController < Dobro.controller_base
  layout 'dobro'

  expose(:resource)           { params[:resource].to_sym }
  expose(:singular_class)     { singular_reference.capitalize.constantize }
  expose(:plural_class)       { resource.to_s.capitalize }
  expose(:singular_reference) { resource.to_s.singularize }
  expose(:records)            { singular_class.all }
  expose(:current_record)     {
    if params[:id]
      singular_class.find params[:id]
    else
      singular_class.new params[singular_reference]
    end
  }

  def create
    if current_record.save
      redirect_to current_record
    else
      render 'new'
    end
  end

  def update
    if current_record.update_attributes(params[singular_reference])
      redirect_to current_record
    else
      render 'edit'
    end
  end

  def destroy
    current_record.destroy
    redirect_to resource
  end
end
