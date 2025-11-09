# Make Rails' automatic field error wrapper compatible with Bootstrap input-groups.
# By default Rails wraps form fields with a div.field_with_errors which can break
# markup that relies on specific child ordering (for example Bootstrap's
# .input-group). Instead, add the `is-invalid` class to the input/select/textarea
# so Bootstrap's validation styles are used and no extra wrapper is injected.

# Keep the proc simple and avoid adding dependencies like Nokogiri.
ActionView::Base.field_error_proc = Proc.new do |html_tag, _instance|
  # If the tag is an input/select/textarea, add `is-invalid` class instead of wrapping.
  if html_tag =~ %r{\A<(input|textarea|select)(\s|>)}i
    if html_tag =~ /class=(['"])((?:.*?))\1/
      # append the class
      html_tag.gsub(/class=(['"])(.*?)\1/) { |m| "class=#{Regexp.last_match(1)}#{Regexp.last_match(2)} is-invalid#{Regexp.last_match(1)}" }
    else
      # inject a class attribute
      html_tag.sub(/<(input|textarea|select)/i) { |m| "#{m} class=\"is-invalid\"" }
    end.html_safe
  else
    # For labels and other tags, leave unchanged (no wrapper)
    html_tag.html_safe
  end
end
