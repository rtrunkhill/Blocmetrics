class RegisterAppController < ApplicationController
  def index
    @register_apps = RegisterApp.all
  end

  def show
    @register_app = RegisterApp.find(params[:id])
  end

  def new
    @register_app = RegisterApp.new
  end

  def create
    @register_app = RegisterApp.new
    @register_app.name = params[:register_app][:name]
    @register_app.url = params[:register_app][:url]
    @register_app.user_id = current_user.id
    
    if @register_app.save
      redirect_to @register_app, notice: "Your App has been assimilated into the system"
    else
      flash.now[:alert] = "Error! Error! Error! Umm, that didn't work"
      render :new
    end
  end

  def edit
    @register_app = RegisterApp.find(params[:id])
  end

  def update
    @register_app = RegisterApp.find(params[:id])
    @register_app.name = params[:register_app][:name]
    @register_app.url = params[:register_app][:url]
    
    if @register_app.save
      flash[:notice] = "Change is good, it's like a whole new App"
      redirect_to @register_app
    else
      flash.now[:alert] = "Error! Error! Error! Umm, that didn't work"
      render :edit
    end
  end

  def destroy
    @register_app = RegisterApp.find(params[:id])
    
    if @register_app.destroy
      flash[:notice] = "#{@register_app.name} has outlived its usefulness. It's gone now"
      redirect_to action: :index
    else
      flash.now[:alert] = "Error! Error! Error! Umm, that didn't work"
      render :show
    end
  end
end
