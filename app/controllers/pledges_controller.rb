class PledgesController < ApplicationController
  before_action :require_login

  def create
    @pledge = Pledge.new(pledge_params)
    @pledge.user = current_user
    @pledge.reward = Reward.find(params[:reward_id])

    if @pledge.save
      @pledge_msg ="You have successfully backed #{@pledge.project.title}!"
      PledgeMailer.send_notification(@pledge.user, @pledge_msg).deliver
      redirect_to project_url(@pledge.project), notice: @pledge_msg
    else
      @project = @pledge.project
      render 'projects/show'
    end
  end

  private

  def pledge_params
    params.require(:pledge).permit(:dollar_amount)
  end
end
