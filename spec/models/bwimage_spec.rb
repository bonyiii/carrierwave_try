require 'spec_helper'

describe Bwimage do

  describe 'base64' do

    let(:bw) {
      Bwimage.create!(:title => 'title',
                      :file => Base64.encode64(File.read(File.join(Rails.root, "spec", "fixtures", "image.jpg"))),
                      :filename => 'some_file.png')
    }

    it 'should crop and grayscale the image and have a processed status afterwards' do
      Base64.encode64(bw.image).should == Base64.encode64(File.read(File.join(Rails.root, "spec", "fixtures", "processed_image.jpg")))
    end

  end # base64

end
