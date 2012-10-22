require 'spec_helper'

describe Api::BwimagesController do

  describe 'create' do

    let(:file) { Base64.encode64(File.read(File.join(Rails.root, "spec", "fixtures", "image.jpg"))) }

    it 'base64' do
      image = {
        title: "Picture title",
        file: file,
        filename: "test_file.jpg"
      }

      post :create, { :bwimage => image.to_json, :format => :json }

      Base64.encode64(File.read(assigns(:bwimage).photo.path)).should == file
      response.should be_success
    end

    it 'url' do
      image = {
        title: "Picture title",
        url: "http://farm9.staticflickr.com/8319/7992673887_a882d4e269_c.jpg",
        filename: "test_file.jpg"
      }

      post :create, { :bwimage => image.to_json, :format => :json }
      assigns(:bwimage).reload

      Base64.encode64(File.read(assigns(:bwimage).photo.path)).should == file
      response.should be_success
    end

  end # base64
end
