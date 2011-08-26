class Dobro::ApplicationController < Dobro.controller_base
  layout 'dobro'

  expose(:resource)           { Dobro.resources[default_resource.to_sym] }
  expose(:singular_class)     { singular_reference.capitalize.constantize }
  expose(:plural_class)       { resource.reference.to_s.capitalize }
  expose(:singular_reference) { resource.reference.to_s.singularize }
  expose(:records)            { singular_class.all }
  expose(:current_record)     {
    if params[:id]
      singular_class.find params[:id]
    else
      singular_class.new params[singular_reference]
    end
  }
  expose(:exclusions)         { [:id,:created_at,:updated_at] }

  before_filter :prepend_view_paths

  def create
    if current_record.save
      redirect_to resource.route_for(current_record)
    else
      render 'new'
    end
  end

  def update
    if current_record.update_attributes(params[singular_reference])
      redirect_to resource.route_for(current_record)
    else
      render 'edit'
    end
  end

  def destroy
    current_record.destroy
    redirect_to resource.index_route
  end

  private

  def default_resource
    params[:resource] || Dobro.resources.keys.first
  end

  def prepend_view_paths
    view_paths.dup.each do |path|
      prepend_view_path Dobro::FileSystemResolver.new(path.to_s, resource)
    end
  end
end
