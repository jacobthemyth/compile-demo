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

  def data_uri_for_playground
  end
end
