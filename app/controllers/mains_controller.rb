class MainsController < ApplicationController
  def index
    
    @rooms = @q.result(distinct: true)
    
  end
end
