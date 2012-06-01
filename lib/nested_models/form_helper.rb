module NestedModels
  module FormHelper
    def add_child_template(form_builder, association, options={})
      options[:object]  ||= form_builder.object.class.reflect_on_association(association).klass.new rescue nil
      options[:partial] ||= association.to_s
      options[:form_builder_local] ||= :f

      content_for :resource_templates do
        content_tag(:script, :id => "#{ association }_fields_template", :type => 'text/html') do
          template = <<-CDATA
          //<![CDATA[
          #{form_builder.fields_for(association, options[:object], :child_index => "new_#{association}") do |f|
              render :partial => options[:partial], :locals => { options[:form_builder_local] => f }
            end
          }
          //]]>
          CDATA

          template.html_safe
        end
      end
    end

    def new_child_link(text, form_builder, association, options={ :class => 'add_child' }, &link_block)
      add_child_template form_builder, association, options

      options[:class] << ' add_child' unless options[:class].include? 'add_child'
      options[:"data-association"] ||= association

      return link_to '#', options, &link_block if link_block
      link_to text, "#", options
    end

    def remove_child_link(text, form_builder, options={ :class => 'remove_child' }, &link_block)
      options[:class] << ' remove_child' unless options[:class].include? 'remove_child'

      link = if link_block
               link_to '#', options, &link_block
             else
               link_to text, '#', options
             end

      form_builder.hidden_field(:_destroy) + link
    end
  end
end
