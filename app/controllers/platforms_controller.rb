class PlatformsController < InheritedResources::Base
  respond_to :html, :xml, :json, :text
  actions :index, :show, :create

  def create
    @uhash = params[:platform][:batches_attributes][0][:uhash] rescue nil
    create! do |success, failure|
      success.text { @success = true }
      failure.text { @success = false }
    end
  end

protected

  def collection
    if params[:sysname]
      @platforms ||= end_of_association_chain.where(:sysname => params[:sysname]).order(:release)
    else
      @platforms ||= end_of_association_chain.order(:sysname).order(:release)
    end
  end
end
