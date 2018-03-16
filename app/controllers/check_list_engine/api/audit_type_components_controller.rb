require_dependency 'check_list_engine/application_controller'

module CheckListEngine
  class Api::AuditTypeComponentsController < BaseController
    before_action :set_audit_type_component, only: [:show, :edit, :update, :destroy]

    # GET /audit_type_components
    def index
      jsonapi_render json: AuditTypeComponent.all
    end

    # GET /audit_type_components/1
    def show
      jsonapi_render json: @audit_type_component
    end

    # GET /audit_type_components/new
    def new
      @audit_type_component = AuditTypeComponent.new
    end

    # POST /audit_type_components
    def create
      @audit_type_component = AuditTypeComponent.new(resource_params)

      if @audit_type_component.save
        jsonapi_render json: @audit_type_component, status: :created
      else
        jsonapi_render_errors json: @audit_type_component, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /audit_type_components/1
    def update
      if @audit_type_component.update(resource_params)
        jsonapi_render json: @audit_type_component
      else
        jsonapi_render_errors json: @audit_type_component, status: :unprocessable_entity
      end
    end

    # DELETE /audit_type_components/1
    def destroy
      @audit_type_component.destroy
      head :no_content
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_audit_type_component
        @audit_type_component = AuditTypeComponent.find(params[:id])
      end
  end
end
