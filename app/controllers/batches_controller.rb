class BatchesController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :index, :show, :edit, :update
  belongs_to :platform

protected

  def resource
    @batch ||= end_of_association_chain.find params[:id]
    authorize_edit if params[:action] == 'edit' || params[:action] == 'update'
    @batch
  end

  def authorize_edit
    unless params[:uhash] == @batch.uhash
      raise ActiveRecord::RecordNotFound
    end
  end
end
