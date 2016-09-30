require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#html_document_string" do
    it "should be an empty document if given no arguments" do
      result = helper.html_document_string

      expect(result).to eq <<~EOS
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset=utf-8>
          </head>
          <body>
          </body>
        </html>
      EOS
    end

    it "should accept content for the head" do
      result = helper.html_document_string(head: "HEAD")

      expect(result).to eq <<~EOS
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset=utf-8>
            HEAD
          </head>
          <body>
          </body>
        </html>
      EOS
    end

    it "should accept content for the body" do
      result = helper.html_document_string(body: "BODY")

      expect(result).to eq <<~EOS
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset=utf-8>
          </head>
          <body>
            BODY
          </body>
        </html>
      EOS
    end
  end

  describe "#data_uri_for_playground" do
    it "should start with a data scheme prefix and the html MIME type" do
      playground = build(:playground)
      result = helper.data_uri_for_playground(playground)
      expect(result).to start_with("data:text/html;charset=utf-8,")
    end

    it "should contain html if given html" do
      html = "<h1>HTML</h1>"
      playground = build(:playground, html: html)
      result = helper.data_uri_for_playground(playground)
      expect(result).to include(URI.encode(html))
    end

    it "should contain css if given html" do
      css = "body { color: chartreuse; }"
      playground = build(:playground, css: css)
      result = helper.data_uri_for_playground(playground)
      expect(result).to include(URI.encode("<style>#{css}</style>"))
    end

    it "should contain js if given js" do
      js = "console.log('Hello');"
      playground = build(:playground, js: js)
      result = helper.data_uri_for_playground(playground)
      expect(result).to include(URI.encode("<script>#{js}</script>"))
    end
  end
end
