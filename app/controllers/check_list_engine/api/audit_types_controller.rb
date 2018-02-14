require_dependency "check_list_engine/application_controller"


module CheckListEngine
  class AuditTypesController < ApplicationController
    before_action :set_audit_type, only: [:show, :edit, :update, :destroy]

    # GET /audit_types
    def index
      Rails.logger.info "index in the engines AuditTypesController called"

      @audit_types = AuditType.all
    end

    def show


    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_audit_type
        @audit_type = AuditType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def audit_type_params
        params.require(:audit_type).permit(:title)
      end
  end
end
