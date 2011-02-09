class EcoParametersController < ApplicationController
  load_and_authorize_resource

  # GET /eco_parameters
  # GET /eco_parameters.xml
  def index
    @eco_parameters = @eco_parameters.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @eco_parameters }
    end
  end

  # GET /eco_parameters/1
  # GET /eco_parameters/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @eco_parameter }
    end
  end

  # GET /eco_parameters/new
  # GET /eco_parameters/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @eco_parameter }
    end
  end

  # GET /eco_parameters/1/edit
  def edit
  end

  # POST /eco_parameters
  # POST /eco_parameters.xml
  def create
    respond_to do |format|
      if @eco_parameter.save
        format.html { redirect_to(@eco_parameter, :notice => t(:create_message, :default => '%{model} was successfully created.', :model => @eco_parameter.class.human_name)) }
        format.xml  { render :xml => @eco_parameter, :status => :created, :location => @eco_parameter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @eco_parameter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /eco_parameters/1
  # PUT /eco_parameters/1.xml
  def update
    respond_to do |format|
      if @eco_parameter.update_attributes(params[:eco_parameter])
        format.html { redirect_to(@eco_parameter, :notice => t(:update_message, :default => '%{model} was successfully updated.', :model => @eco_parameter.class.human_name)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @eco_parameter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /eco_parameters/1
  # DELETE /eco_parameters/1.xml
  def destroy
    @eco_parameter.destroy

    respond_to do |format|
      format.html { redirect_to(eco_parameters_url) }
      format.xml  { head :ok }
    end
  end
end
