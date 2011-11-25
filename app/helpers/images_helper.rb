module ImagesHelper
  def render_image_for(image, options={})
    if(image.file_uid)
      options[:resolution] ||= '60x70'
      options[:html] ||= {}
      img = image_tag(image.file.thumb(options[:resolution]).url)
      link_to(img, image.file.url, options[:html])
    end
  end
end
