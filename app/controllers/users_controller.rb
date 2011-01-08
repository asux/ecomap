class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter :check_role_changing, :only => [:create, :update]

  # GET /users
  # GET /users.xml
  def index
    @users = @users.paginate(:page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.xml
  def create
    respond_to do |format|
      if @user.save
        format.html { redirect_to(@user, :notice => t(:create_message, :default => '%{model} was successfully created.', :model => @user.class.human_name)) }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => t(:update_message, :default => '%{model} was successfully updated.', :model => @user.class.human_name)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end

  protected
    def check_role_changing
      if cannot? :assign_role, @user
        new_role = Role.new(params[:user].delete(:role))
        flash[:warning] = t('users.unable_assign_role', :default => "You unable to assign role <strong>%{role}</strong> for user <strong>%{user}</strong>.", :role => new_role.human_name, :user => @user.to_s)
      end
    end
end
