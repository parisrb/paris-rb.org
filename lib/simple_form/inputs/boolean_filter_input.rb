module SimpleForm
  module Inputs
    class BooleanFilterInput < CollectionSelectInput
      def input
        label_method, value_method = detect_collection_methods
        collection = [ [ I18n.t("yes", scope: "simple_form"), true ],
                      [ I18n.t("no",  scope: "simple_form"), false ] ]

        @builder.collection_select(attribute_name,
                                   collection,
                                   value_method,
                                   label_method,
                                   input_options,
                                   input_html_options)
      end
    end
  end
end
