class BatchesController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :index, :show
  belongs_to :platform
end
