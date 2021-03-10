require 'redmine'

class EcusController < ApplicationController

  before_action :find_project, :authorize

  def new_ecu
    @ecu = Ecu.new
  end

  def create_ecu
    @bench = Bench.find(params[:bench])
    @ecu = @bench.ecus.new(ecu_params)
    if @ecu.save
      flash[:notice] = 'Successfully created ECU'
      redirect_to :controller => 'benches', :action => 'show_bench'
    else
      flash[:error] = 'Failed to create ECU. The "name" field have to be filled.'
      render :action => 'new_ecu'
    end
  end

  def edit_ecu
    @bench = Bench.find(params[:bench])
    @ecu = @bench.ecus.find(params[:ecu])
  end

  def update_ecu
    @bench = Bench.find(params[:bench])
    @ecu = @bench.ecus.find(params[:ecu])

    if @ecu.update(ecu_params)
       flash[:notice] = 'Successfully updated ECU'
       redirect_to :controller => 'benches', :action => 'show_bench'#, :id => params[:id]
    else
       render :action => 'edit_ecu'
    end
  end


  def delete_ecu
    @bench = Bench.find(params[:bench])
    @ecu = @bench.ecus.find(params[:ecu])
    @ecu.destroy

    redirect_to :controller => 'benches', :action => 'show_bench'
  end

  private

  def find_project
    @project = Project.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def ecu_params
    params.permit(:name, :partnumber, :bootloader, :sw_version, :hw_version)
  end
end
