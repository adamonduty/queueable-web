class RunsController < InheritedResources::Base
  respond_to :html, :xml, :json
  belongs_to :platform, :batch
end
