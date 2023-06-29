class TenantController < ApplicationController
    before_action :set_tenant, only: [:show, :update, :destroy ]

    def index
        @tenant = Tenant.all
        render json: @tenants
    end

    def show
        render json: @tenant
    end

    def create
        @tenant = Tenant.new(tenant_params)

        if tenant.save 
            render json: @tenant, status: :created
        else
            render json: @tenant.errors, status: :unprocessible_entity
        end

    end




end
