class CommitteeMembersController < ApplicationController
  before_action :set_committee_member, only: [:show, :edit, :update, :destroy]

  # GET /committee_members
  # GET /committee_members.json
  def index
    @committee_members = CommitteeMember.all
  end

  # GET /committee_members/1
  # GET /committee_members/1.json
  def show
  end

  # GET /committee_members/new
  def new
    @committee_member = CommitteeMember.new
  end

  # GET /committee_members/1/edit
  def edit
  end

  # POST /committee_members
  # POST /committee_members.json
  def create
    @committee_member = CommitteeMember.new(committee_member_params)

    respond_to do |format|
      if @committee_member.save
        format.html { redirect_to @committee_member, notice: 'Committee member was successfully created.' }
        format.json { render :show, status: :created, location: @committee_member }
      else
        format.html { render :new }
        format.json { render json: @committee_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committee_members/1
  # PATCH/PUT /committee_members/1.json
  def update
    respond_to do |format|
      if @committee_member.update(committee_member_params)
        format.html { redirect_to @committee_member, notice: 'Committee member was successfully updated.' }
        format.json { render :show, status: :ok, location: @committee_member }
      else
        format.html { render :edit }
        format.json { render json: @committee_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /committee_members/1
  # DELETE /committee_members/1.json
  def destroy
    @committee_member.destroy
    respond_to do |format|
      format.html { redirect_to committee_members_url, notice: 'Committee member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_committee_member
      @committee_member = CommitteeMember.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committee_member_params
      params.require(:committee_member).permit(:committee_id, :council_member_id, :chair, :vice_chair)
    end
end
