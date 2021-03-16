require 'redmine'

class BenchesController < ApplicationController

  before_action :find_project, :authorize

  def index
    @sub_projects = @project.children
    @benches = Bench.where(project_id: @project.identifier)
    if @subprojects.nil?
       @sub_projects.each do |sub|
         @benches += Bench.where(project_id: sub.identifier)
       end
    end
  end

  def show_bench
    @bench = Bench.find(params[:bench])
  end

  def new_bench
    @bench = Bench.new()
  end

  def create_bench
    @bench = Bench.new(bench_params)
    if @bench.save
      flash[:notice] = 'Successfully created Bench'
      redirect_to :action => 'index'
    else
      flash[:error] = 'Failed to create Bench. Please fill all fields.'
      render :action => 'new_bench'
    end

  end

  def edit_bench
    @bench = Bench.find(params[:bench])
  end

  def update_bench
    @bench = Bench.find_by_id(params[:bench])

    if @bench.update!(bench_params)
      flash[:notice] = 'Successfully updated Bench'
      redirect_to :action => 'show_bench'#, :id => params[:id]
    else
      render :action => 'edit_bench'
    end
  end

  def delete_bench
    @bench = Bench.find(params[:bench])
    if @bench.ecus.length > 0
      flash[:warning] = 'Not possible to delete the test bench. First delete all ECUs'
      redirect_to :action => 'show_bench'
    else
      @bench.destroy
      redirect_to :action => 'index'
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def bench_params
    params.permit(:name, :vin, :platform, :project_id)
  end

end
