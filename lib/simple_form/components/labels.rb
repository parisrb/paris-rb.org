module SimpleForm
  module Components
    module Labels
      module ClassMethods
        def translate_optional_html
          i18n_cache :translate_optional_html do
            I18n.t(
              :"optional.html",
              scope: i18n_scope,
              default: I18n.t(:"optional.text", scope: i18n_scope, default: '(optional)'))
          end
        end
      end

      protected def required_label_text #:nodoc:
        required_field? ? '' : self.class.translate_optional_html.dup
      end
    end
  end
end
