class BatchesController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :index, :show, :edit, :update
  belongs_to :platform
  after_filter :authorize_edit, :only => [:edit, :update]

protected

  def authorize_edit
    unless params[:uhash] == @batch.uhash
      raise ActiveRecord::RecordNotFound
    end
  end
end
