class UsersController < ApplicationController
  before_filter :require_user, :except => [:new, :create]
  before_filter :require_admin, :only => [:index, :export_csv]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.haml
    end
  end

  def export_csv
    respond_to do |format|
      format.csv {
        send_data(User.export_csv, :type => 'text/plain')
      }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.haml
    end
  end

  def edit
    @user = User.find(params[:id])
    if (@user != current_user) && !logged_in_as_admin?
      flash[:notice] = "You are not allowed to see another user's info :)"
      redirect_to edit_user_url(:id => current_user.id)
    end
  end
  
  def toggle_paid
    if logged_in_as_admin?
      @user = User.find(params[:userId])
      @user.paid = params[:checked]
      @user.save
    end
    render :nothing => true
  end
  
  def toggle_admin
    @user = User.find(params[:userId])
    if logged_in_as_admin? && @user != current_user
      @user.is_admin = params[:checked]
      @user.save
    end
    render :nothing => true
  end

#TODO TEST THIS SHIT
  def create
    user_params = params[:user]
    user_params.delete(:is_admin)
    
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

#TODO TEST THIS SHIT
  def update
    user_params = params[:user]
    user_params.delete(:is_admin)
    
    respond_to do |format|
      user = User.find(params[:id])
      if impersonating_user && user.update_attributes(user_params)
        format.html { redirect_to(users_path, :notice => "#{user.first_name}\'s profile was successfully updated.") }
      elsif current_user.update_attributes(user_params)
        format.html { redirect_to(current_user, :notice => 'User was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy if logged_in_as_admin?
    
    respond_to do |format|
        format.html { redirect_to(users_url) }
        format.xml  { head :ok }
    end
  end
  
  private
  
  def impersonating_user
    logged_in_as_admin? && (params[:id] != current_user.id)
  end
end
