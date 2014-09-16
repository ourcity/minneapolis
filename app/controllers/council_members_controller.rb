class CouncilMembersController < ApplicationController
  before_action :set_council_member, only: [:show, :edit, :update, :destroy]

  # GET /council_members
  # GET /council_members.json
  def index
    @council_members = CouncilMember.all
  end

  # GET /council_members/1
  # GET /council_members/1.json
  def show
    @committees = []
    @council_member.committee_members.each do |committee_member|
      @committees << Committee.find(committee_member.committee_id)
    end
  end

  # GET /council_members/new
  def new
    @council_member = CouncilMember.new
  end

  # GET /council_members/1/edit
  def edit
  end

  # POST /council_members
  # POST /council_members.json
  def create
    @council_member = CouncilMember.new(council_member_params)

    respond_to do |format|
      if @council_member.save
        format.html { redirect_to @council_member, notice: 'Council member was successfully created.' }
        format.json { render :show, status: :created, location: @council_member }
      else
        format.html { render :new }
        format.json { render json: @council_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /council_members/1
  # PATCH/PUT /council_members/1.json
  def update
    respond_to do |format|
      if @council_member.update(council_member_params)
        format.html { redirect_to @council_member, notice: 'Council member was successfully updated.' }
        format.json { render :show, status: :ok, location: @council_member }
      else
        format.html { render :edit }
        format.json { render json: @council_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /council_members/1
  # DELETE /council_members/1.json
  def destroy
    @council_member.destroy
    respond_to do |format|
      format.html { redirect_to council_members_url, notice: 'Council member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_council_member
    @council_member = CouncilMember.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def council_member_params
    params.require(:council_member).permit(:ward, :first_name, :last_name, :committee_member_id)
  end
end
