class SupportsController < ApplicationController
def index
@supports = Support.all
end

def show
@support = Suport.find(params[:id])
end
end
