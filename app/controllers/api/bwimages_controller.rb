class Api::BwimagesController < ApplicationController

  # POST /bwimages
  # POST /bwimages.json
  def create
    begin
      data = JSON.parse(params[:bwimage])
      # http://stackoverflow.com/questions/9854916/base64-upload-from-android-java-to-ror-carrierwave
    rescue TypeError => e
      logger.error "Cannot parse params as JSON #{params[:bwimage]}"
    end

    @bwimage = Bwimage.new(data)

    respond_to do |format|
      if @bwimage.save
        @bwimage.process_photo
        FayeClient::photo_added(@bwimage)
        format.html { head 200 }
        format.json { head 200 }
      else
        format.html { render json: @bwimage.errors, status: :unprocessable_entity }
        format.json { render json: @bwimage.errors, status: :unprocessable_entity }
      end
    end
  end

end
