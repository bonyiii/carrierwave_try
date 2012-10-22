class Api::BwimagesController < ApplicationController

  # POST /bwimages
  # POST /bwimages.json
  def create

    if params[:bwimage][:file].present?
      tempfile = Tempfile.new("fileupload")
      tempfile.binmode
      #get the file and decode it with base64 then write it to the tempfile
      tempfile.write(Base64.decode64(params[:bwimage][:file]))

      #create a new uploaded file
      uploaded_file = ActionDispatch::Http::UploadedFile.new(:tempfile => tempfile, 
                                                             :filename => params[:bwimage][:filename], 
                                                             :original_filename => params[:bwimage][:filename])
      params[:bwimage].delete(:file)
      params[:bwimage][:photo] = uploaded_file
    end

    @bwimage = Bwimage.new(params[:bwimage])

    respond_to do |format|
      if @bwimage.save
        format.html { head 200 }
        format.json { head 200 }
        # format.json { render json: @bwimage, status: :created, location: @bwimage }
      else
        format.html { render action: "new" }
        format.json { render json: @bwimage.errors, status: :unprocessable_entity }
      end
    end
  end

end
