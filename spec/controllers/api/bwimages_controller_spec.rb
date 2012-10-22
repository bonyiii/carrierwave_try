require 'spec_helper'

describe Api::BwimagesController do

  describe 'create' do

    let(:file) { Base64.encode64(File.read(File.join(Rails.root, "spec", "fixtures", "image.jpg"))) }

    it 'should crop and grayscale the image and have a processed status afterwards' do
      image = {
        title: "Picture title",
        file: file,
        filename: "test_file.jpg"
      }

      post :create, { :bwimage => image, :format => :json }

      Base64.encode64(File.read(assigns(:bwimage).photo.path)).should == file
      response.should be_success
    end

  end # base64
end
