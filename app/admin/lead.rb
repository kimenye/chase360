ActiveAdmin.register Lead do

  scope :open
  scope :verified
  scope :closed
  scope :all


  member_action :verify do
    @lead = Lead.find(params[:id])
  end

  action_item :only => :show do
    link_to('Verify', verify_admin_lead_path(lead)) if lead.status == "Closed"
  end

  member_action :confirm, :method => :post  do
    @lead = Lead.find(params[:id])
  end

  controller do
    def confirm
      @lead = Lead.find(params[:id])

      @lead.verified = true
      @lead.value = params[:lead][:value]
      @lead.verified_by_id = params[:lead][:verified_by_id]
      @lead.status = "Verified"
      @lead.save!

      respond_to do |format|
        format.html { redirect_to admin_lead_path(@lead), notice: "Lead was verified" }
      end
    end
  end

  member_action :close  do
    @lead = Lead.find(params[:id])
  end

  action_item :only => :show, :method => :post do
    link_to('Close', close_admin_lead_path(lead)) if lead.status != "Closed"
  end

  controller do
    def close
      @lead = Lead.find(params[:id])

      @lead.status = "Closed"
      @lead.save!
      # product = @lead.product
      # company = product.company
      manager = User.where(company_id: @lead.product.company.id, role_id: Role.find_by(name: "Manager").id).sample
      LeadMailer.closed_lead_notification(@lead.assigned_to, @lead, @lead.submitted_by).deliver
      LeadMailer.closed_lead_notification_to_manager(@lead.assigned_to, @lead, manager,@lead.submitted_by).deliver
      respond_to do |format|
        format.html { redirect_to admin_lead_path(@lead), notice: "Lead was Closed!" }
      end
    end
  end

  permit_params :name, :phone_number, :email, :status, :submitted_by_id, :assigned_to_id, :product_id, :branch_id, :verified_by_id, :value

  index do
    column :id
    column :name
    column :email
    column :phone_number
    column :status
    column :submitted_by
    column :assigned_to
    column :company
    column :product    
    column :branch
    
    actions defaults: true do |lead|
      link_to 'Verify', verify_admin_lead_path(lead) if lead.status == "Closed"
      # link_to 'Close', close_admin_lead_path(lead)
    end
  end
  
end
