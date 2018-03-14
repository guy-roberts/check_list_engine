require_dependency 'check_list_engine/application_controller'

module CheckListEngine
  class Api::AuditTypeComponentsController < ApplicationController
    before_action :set_audit_type_component, only: [:show, :edit, :update, :destroy]

    # GET /audit_type_components
    def index
      @audit_type_components = AuditTypeComponent.all
    end

    # GET /audit_type_components/1
    def show
    end

    # GET /audit_type_components/new
    def new
      @audit_type_component = AuditTypeComponent.new
    end

    # GET /audit_type_components/1/edit
    def edit
    end

    # POST /audit_type_components
    def create
      @audit_type_component = AuditTypeComponent.new(audit_type_component_params)

      if @audit_type_component.save
        render json: @audit_type_component, status: :created
      else
        render json: @audit_type_component.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /audit_type_components/1
    def update
      if @audit_type_component.update(audit_type_component_params)
        render json: @audit_type_component, status: :created
      else
        render json: @audit_type_component.errors, status: :unprocessable_entity
      end
    end

    # DELETE /audit_type_components/1
    def destroy
      begin
        @audit_type_component.destroy
        head :no_content
      rescue
        render json: @audit_type_component.errors, status: :unprocessable_entity
      end

    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_audit_type_component
        @audit_type_component = AuditTypeComponent.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def audit_type_component_params
        params.require(:audit_type_components).permit(:title, :audit_type_id, :help_text, :position, :available_component_id, :available_component, :has_image, :choices)
      end
  end
end
