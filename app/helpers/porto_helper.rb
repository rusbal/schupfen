module PortoHelper

  def banner_image
   if @post.has_thumb?
     raw @post.the_thumb_url
   else
     '/media/1/parallax_restaurant_2.jpg'
   end
  end

  def swf_tag(file)
    "<embed width='936' height='585' src='#{asset_path('ps.swf')}'>".html_safe
  end
end

