require_dependency 'check_list_engine/application_controller'

module CheckListEngine
  class Api::AuditTypesController < ApplicationController
    before_action :set_audit_type, only: [:show, :edit, :update, :destroy]

    #skip_before_filter :verify_authenticity_token


    # GET /audit_types
    def index
      @audit_types = AuditType.order(:title)#TODO Sort out Kaminari  .page params[:page]

      json_api_data = AuditTypeSerializer.new(@audit_types).serialized_json

      render json: json_api_data
    end

    def show

      # Tell the serializer to include information for the audit_type_components
      options = {}
      options[:include] = [:audit_type_components]

      render json: AuditTypeSerializer.new(@audit_type, options).serialized_json, method: :show
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

    # PATCH/PUT /audit_type/1
    def update
      if @audit_type.update(audit_type_params)
        render json: @audit_type
      else
        Rails.logger.error('Failed to update audit_type')

        render json: @audit_type.errors, status: :unprocessable_entity
      end
    end

    # DELETE /audit_type/1
    def destroy
      @audit_type.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_audit_type
        @audit_type = AuditType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def audit_type_params
        params.require(:audit_type).permit(:title, :audit_type_components)
      end
  end
end
