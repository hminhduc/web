class SamplesController < ApplicationController
  def index
  end
  def uploadFile
    post = Sample.save(params[:upload])
    render text: "File have been uploaded successfully"
  end
end