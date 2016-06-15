# Called by PortoHelper#post_widget
#
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

    if id.is_a? Array
      current_site.the_posts.where(id: id).to_a
    else
      current_site.the_posts.where(id: id).first
    end
  end

  def collect_custom_fields(widget)
    collect_method = "collect_#{type.to_s}_fields"
    self.send(collect_method, widget)
  end

  private

  attr_reader :current_site, :type

  def collect_testimonial_fields(widget)
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

  def collect_slider_fields(widget)
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

  def collect_gallery_fields(widget)
    widget.get_field_values_hash[:gallery]
  end

  def collect_team_fields(widgets)
    data = []

    widgets.each do |widget|
      wd = widget.decorate

      data << { :name    => wd.the_title,
                :about   => wd.the_excerpt,
                :picture => wd.get_field(:'team-member-picture') }
    end

    data
  end

end
