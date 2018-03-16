require_dependency 'check_list_engine/application_controller'

module CheckListEngine
  class AuditTypesController < BaseController

    before_action :set_audit_type, only: [:show, :edit, :update, :destroy]

    # GET /audit_types
    def index
      @audit_types = AuditType.order(:title)#TODO Sort out Kaminari  .page params[:page]

      jsonapi_render json: @audit_types
    end

    def show
      jsonapi_render json: @audit_type
    end

    # POST /audit_type
    def create
      a = 1
      audit_type = AuditType.new(resource_params)

      if audit_type.save
        jsonapi_render json: audit_type, status: :created
      else
        jsonapi_render_errors json: audit_type, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /audit_type/1
    def update
      if @audit_type.update(resource_params)
        jsonapi_render json: @audit_type
      else
        jsonapi_render_errors json: @audit_type, status: :unprocessable_entity
      end
    end

    # DELETE /audit_type/1
    def destroy
      @audit_type.destroy
      head :no_content
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_audit_type
        @audit_type = AuditType.find(params[:id])
      end
  end
end
