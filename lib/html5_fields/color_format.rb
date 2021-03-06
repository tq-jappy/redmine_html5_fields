module Html5Fields
  module FieldFormat
    class ColorFormat < Redmine::FieldFormat::Unbounded
      add 'color'
      self.searchable_supported = true
      self.form_partial = 'custom_fields/formats/link'

      def cast_single_value(custom_field, value, customized=nil)
        "aaa"
      end

      def validate_single_value(custom_field, value, customized=nil)
        if value =~ /^#[0-9a-f]{6}$/
          []
        else
          [::I18n.t('activerecord.errors.messages.not_a_color')]
        end
      end

      def edit_tag(view, tag_id, tag_name, custom_value, options={})
        value = custom_value.value.blank? ? "#009900" : custom_value.value
        view.text_field_tag(tag_name, value, options.merge(:id => tag_id, :size => 10, :type => "color"))
      end

      def bulk_edit_tag(view, tag_id, tag_name, custom_field, objects, value, options={})
        value = value.blank? ? "#009900" : value
        view.text_field_tag(tag_name, value, options.merge(:id => tag_id, :size => 10, :type => "color"))
      end

      def query_filter_options(custom_field, query)
        {:type => :string}
      end

      def group_statement(custom_field)
        order_statement(custom_field)
      end
    end
  end
end
