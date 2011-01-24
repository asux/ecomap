class SamplesController < ApplicationController
  load_and_authorize_resource

  # GET /samples
  # GET /samples.xml
  def index
    @samples = @samples.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @samples }
    end
  end

  # GET /samples/1
  # GET /samples/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sample }
    end
  end

  # GET /samples/new
  # GET /samples/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sample }
    end
  end

  # GET /samples/1/edit
  def edit
  end

  # POST /samples
  # POST /samples.xml
  def create
    respond_to do |format|
      if @sample.save
        format.html { redirect_to(@sample, :notice => t(:create_message, :default => '%{model} was successfully created.', :model => @sample.class.human_name)) }
        format.xml  { render :xml => @sample, :status => :created, :location => @sample }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sample.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /samples/1
  # PUT /samples/1.xml
  def update
    respond_to do |format|
      if @sample.update_attributes(params[:sample])
        format.html { redirect_to(@sample, :notice => t(:update_message, :default => '%{model} was successfully updated.', :model => @sample.class.human_name)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sample.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /samples/1
  # DELETE /samples/1.xml
  def destroy
    @sample.destroy

    respond_to do |format|
      format.html { redirect_to(samples_url) }
      format.xml  { head :ok }
    end
  end
end
