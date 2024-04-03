require "simple_form/inputs/bootstrap_inputs"

# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap_horizontal, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: { tag: "div", class: "col-sm-3" }
    b.use :input, wrap_with: { tag: "div", class: "col-sm-9" }
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "span", class: "help-block" }
    b.optional :pattern
  end

  config.wrappers :input_group, tag: "div", class: "form-group", error_class: "has-error" do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: { class: "sr-only" }
    b.wrapper tag: "div", class: "input-group" do |input_group|
      input_group.use :input
    end
    b.use :error, wrap_with: { tag: "span", class: "help-block" }
    b.use :hint,  wrap_with: { tag: "span", class: "help-block" }
    b.optional :pattern
  end

  config.wrappers :checkbox, tag: :div, class: "checkbox", error_class: "has-error" do |b|
    b.use :html5
    b.wrapper tag: "label", class: "col-sm-9 col col-sm-offset-3" do |ba|
      ba.use :input
      ba.use :label_text
    end
    b.use :hint,  wrap_with: { tag: :p, class: "help-block" }
    b.use :error, wrap_with: { tag: :span, class: "help-block text-danger" }
  end

  config.default_wrapper = :bootstrap_horizontal
end
