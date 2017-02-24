class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
    if params[:search]
    @projects = Project.search(params[:search]).order("created_at DESC")
  else
    @projects = Project.all.order("created_at DESC")
  end

  end



  def show
    @project = Project.find(params[:id])
    @pledges = @project.pledges
    @result = 0
    @pledges.each do |b|

      @result = b.dollar_amount + @result



    end

  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user

    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image, rewards_attributes: [:dollar_amount, :description])
  end
end
