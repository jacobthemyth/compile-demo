module ApplicationHelper
  def html_document_string(content = {})
      (<<~EOS).gsub(/^\s+$\n/, '')
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset=utf-8>
            #{content[:head]}
          </head>
          <body>
            #{content[:body]}
          </body>
        </html>
      EOS
  end

  def data_uri_for_playground(playground)
    head_content = ""
    head_content << "<style>#{playground.css}</style>" if playground.css.present?
    head_content << "<script>#{playground.js}</script>" if playground.js.present?
    doc = html_document_string(head: head_content, body: playground.html)
    encoded_html = URI.encode(doc)
    "data:text/html;charset=utf-8,#{encoded_html}"
  end
end
