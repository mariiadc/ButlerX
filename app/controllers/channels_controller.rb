class ChannelsController < ApplicationController
  before_action :load_entities

  def index
    @channnels = policy_scope(Channel)
  end

  def new
    @channel = Channel.new
    authorize @channel
  end

  def create
    @channel = Channel.new permitted_parameters
    authorize @channel

    if @channel.save
      flash[:success] = "channel #{@channel.name} was created successfully"
      redirect_to channels_path
    else
      render :new
    end
  end

  def edit
    authorize @channel
  end

  def update
    authorize @channel
    if @channel.update_attributes(permitted_parameters)
      flash[:success] = "channel #{@channel.name} was updated successfully"
      redirect_to channels_path
    else
      render :new
    end
  end

  protected

  def load_entities
    @channels = Channel.all
    @channel = Channel.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:channel).permit(:name)
  end
end
