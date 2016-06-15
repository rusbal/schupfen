class CamaleonCms::PostWidgets

  def initialize(args)
    @post         = args[:post]
    @current_site = args[:current_site]
    @type         = args[:type]
  end

  def get_widget
    fields = @post.get_fields_object(true)
    return unless fields[type]
    id     = fields[type][:values] || fields[type][:value]
    current_site.the_posts.where(id: id).first
  end

  def collect_custom_fields(widget)
    if type == :testimonial
      collect_custom_testimonial_fields(widget)
    elsif type == :slider
      collect_custom_slider_fields(widget)
    elsif type == :gallery
      collect_custom_gallery_fields(widget)
    end
  end

  private

  attr_reader :current_site, :type

  def collect_custom_testimonial_fields(widget)
    data = []

    texts     = widget.get_field_values(:'testimonial-text')
    names     = widget.get_field_values(:'testimonial-name')
    positions = widget.get_field_values(:'testimonial-position')

    texts.each_with_index do |text, idx|
      data << { :text     => text,
                :name     => names[idx],
                :position => positions[idx] }
    end

    data
  end

  def collect_custom_slider_fields(widget)
    data = []

    images     = widget.get_field_values(:'slider-images')
    pre_titles = widget.get_field_values(:'slider-pre-title')
    titles     = widget.get_field_values(:'slider-title')
    subtitles  = widget.get_field_values(:'slider-subtitle')

    images.each_with_index do |image, idx|
      data << { :image     => image,
                :pre_title => pre_titles[idx],
                :title     => titles[idx],
                :subtitle  => subtitles[idx] }
    end

    data
  end

  def collect_custom_gallery_fields(widget)
    widget.get_field_values_hash[:gallery]
  end
end
