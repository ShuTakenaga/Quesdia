def image_upload(img)
  logger.info "upload now"
  tempfile = img[:tempfile]
  upload = Cloudinary::Uploader.upload(tempfile.path)
  contents = Idea.last
  contents.update_attribute(:img, upload['url'])
end