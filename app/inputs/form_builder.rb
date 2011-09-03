class FormBuilder < Formtastic::SemanticFormBuilder
  protected
  def connection_input method, options = {}
    options = set_include_blank(options)
    html_options = options.delete(:input_html) || {}
    input_name = generate_association_input_name(method)
    selected = @object.send(input_name)
    self.label(method, options_for_label(options)) << 
      self.text(input_name)
  end
end
