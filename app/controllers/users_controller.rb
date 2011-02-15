class UsersController < ApplicationController
  before_filter :require_user, :except => [:new, :create]
  before_filter :require_admin, :only => [:index]

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.haml
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

  def create
    user_params = params[:user]
    @user = User.new(user_params)
    @user.zip_code = user_params["zip_code"].nil? ? nil : user_params["zip_code"].to_i
    
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

  def update
    user_params = params[:user]
    respond_to do |format|
      if current_user.update_attributes(user_params)
        format.html { redirect_to(current_user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
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
end
