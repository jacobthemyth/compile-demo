# frozen_string_literal: true
# :nodoc:
module ApplicationHelper
  def data_uri_for_playground(playground)
    doc = HTMLDocument.new(body: playground.html)

    doc.append_style_tag_to_head(playground.css) if playground.css.present?
    doc.append_script_tag_to_head(playground.js) if playground.js.present?

    encoded_html = URI.encode(doc.to_s)
    "data:text/html;charset=utf-8,#{encoded_html}"
  end
end
