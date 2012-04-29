class PlatformsController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :index, :show, :create

protected

  def collection
    if params[:sysname]
      @platforms ||= end_of_association_chain.where(:sysname => params[:sysname]).order(:release)
    else
      @platforms ||= end_of_association_chain.order(:sysname).order(:release)
    end
  end
end
