class ApatmentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound,with: :no_response
    def index
        apatments = Apatment.all
        render json: apatments
    end
    def show 
        apatment = Apatment.find(params[:id])
        render json: apatment
    end
    def create
        apatment = Apatment.create(apatment_params)
        render json: apatment, status: :created
    end
    def update 
        apatment = Apatment.find(params[:id])
        apatment.update(apatment_params)
        render json: apatment
    end
    def destroy
        apatment = Apatment.find(params[:id])
        apatment.destroy
        head :no_content
    end

    private
    def apatment_params
        params.require(:apatment).permit(:number)
    end
    def no_response
        render json: {error: "Record Does Not Exist"},status: :unprocessable_entity
    end
end
