require_dependency "check_list_engine/application_controller"

module CheckListEngine
  class Api::AvailableComponentsController < ApplicationController
    before_action :set_available_component, only: [:show, :edit, :update, :destroy]

    # GET /available_components
    def index
      @available_components = AvailableComponent.all
    end

    # GET /available_components/1
    def show
    end

    # GET /available_components/new
    def new
      @available_component = AvailableComponent.new
    end

    # GET /available_components/1/edit
    def edit
    end

    # POST /available_components
    def create
      @available_component = AvailableComponent.new(available_component_params)

      if @available_component.save
        redirect_to @available_component, notice: 'Available component was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /available_components/1
    def update
      if @available_component.update(available_component_params)
        redirect_to @available_component, notice: 'Available component was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /available_components/1
    def destroy
      @available_component.destroy
      redirect_to available_components_url, notice: 'Available component was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_available_component
        @available_component = AvailableComponent.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def available_component_params
        params.require(:available_component).permit(:title, :has_photo)
      end
  end
end
