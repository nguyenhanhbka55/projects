class ProfilesController < ApplicationController
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

 
  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to action: 'index', notice: 'successfully created'
    else
      render action: 'new', alert: 'Profile could not be create'
    end
  end
  
  def update    
      if @profile.update(profile_params)
        render action: 'show', notice: 'Profile was successfully updated'        
      else
        render action: 'edit'        
      end    
  end
  
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private    
    #def set_profile
     # @profile = Profile.find(params[:id])
    #end

    def profile_params
      params.require(:profile).permit(:name, :avatar, :resume)
    end
end
