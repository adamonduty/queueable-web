class WelcomeController < ApplicationController
  def index
    @recent = Batch.recent
  end
end
