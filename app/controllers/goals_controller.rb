class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /goals
  # GET /goals.json
  def index
    @goals = Store.get_users_store current_user.id
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
  end

  # GET /goals/new
  def new
    if current_user.proprietario?
      @goal = Goal.new
    else
      redirect_to goals_url, notice: I18n.t(:not_allowed, scope: [:generic, :permition])
    end
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @goal.save
        format.html { redirect_to goals_url, notice: I18n.t(:new, scope: [:generic, :confirmation]) }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params.merge(user_id: current_user.id))
        format.html { redirect_to goals_url, notice: I18n.t(:edit, scope: [:generic, :confirmation]) }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: I18n.t(:delete, scope: [:generic, :confirmation]) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(
        :user_id,
        :store_id,
        :name,
        :month,
        :start_date,
        :end_date,
        :total_value
      )
    end
end
