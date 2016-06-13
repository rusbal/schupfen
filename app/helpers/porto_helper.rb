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

  def website_logo(opts = {})
    media_path = opts[:media_path]
    use_text   = opts[:use_text]
    text_logo  = '<div class="text"><span class="text-1">gasthaus</span><span>schupfen</span></div>'.html_safe

    return text_logo if use_text

    if FileTest.exist?("#{Rails.root}/public/#{media_path}")
      "<img alt='Porto' width='100' height='48' src='#{media_path}'>".html_safe
    else
      text_logo
    end
  end
end

