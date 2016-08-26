module ApplicationHelper
    
    def gravitar_for(user, options = { size: 80 })
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.firstname, class: "img-circle")
    end

    # module ActionView
    #   module Helpers
    #     class FormBuilder 
    #       def date_select(method, options = {}, html_options = {})
    #         existing_date = @object.send(method) 
    #         formatted_date = existing_date.to_date.strftime("%F") if existing_date.present?
    #         @template.content_tag(:div, :class => "input-group") do    
    #           text_field(method, :value => formatted_date, :class => "form-control datepicker", :"data-date-format" => "YYYY-MM-DD") +
    #           @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
    #         end
    #       end

    #       def datetime_select(method, options = {}, html_options = {})
    #         existing_time = @object.send(method) 
    #         formatted_time = existing_time.to_time.strftime("%F %I:%M %p") if existing_time.present?
    #         @template.content_tag(:div, :class => "input-group") do    
    #           text_field(method, :value => formatted_time, :class => "form-control datetimepicker", :"data-date-format" => "YYYY-MM-DD hh:mm A") +
    #           @template.content_tag(:span, @template.content_tag(:span, "", :class => "glyphicon glyphicon-calendar") ,:class => "input-group-addon")
    #         end
    #       end
    #     end
    #   end
    # end
    
end
