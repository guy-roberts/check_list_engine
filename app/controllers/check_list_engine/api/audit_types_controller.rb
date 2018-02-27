require_dependency 'check_list_engine/application_controller'


module CheckListEngine
  class Api::AuditTypesController < ApplicationController
    before_action :set_audit_type, only: [:show, :edit, :update, :destroy]

    # GET /audit_types
    def index
      Rails.logger.info 'index in the engines AuditTypesController called'

      render json: AuditType.all
    end

    def show

    end

    # POST /audit_type
    def create
      audit_type = AuditType.new(audit_type_params)

      if audit_type.save
        render json: audit_type, status: :created
      else
        render json: audit_type.errors, status: :unprocessable_entity
      end
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
