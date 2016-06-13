module PortoHelper

  def banner_image
   if @post.has_thumb?
     raw @post.the_thumb_url
   else
     '/media/1/parallax_restaurant_2.jpg'
   end
  end

end

