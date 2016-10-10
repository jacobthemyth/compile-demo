# frozen_string_literal: true
# Encapsulates the logic for building an HTML document from content strings
class HTMLDocument
  def initialize(body: '')
    @body = body
  end

  def append_style_tag_to_head(content)
    head_styles << content
  end

  def append_script_tag_to_head(content)
    head_scripts << content
  end

  def to_s
    <<~EOS.gsub(/^\s+$\n/, '')
      <!DOCTYPE html>
      <html lang="en">
        <head>
          <meta charset="utf-8">
          #{head}
        </head>
        <body>
          #{body}
        </body>
      </html>
    EOS
  end

  private

  def head
    head_styles.map { |s| "<style>#{s}</style>" }.join("\n") +
      head_scripts.map { |s| "<script>#{s}</script>" }.join("\n")
  end

  def head_styles
    @head_styles ||= []
  end

  def head_scripts
    @head_scripts ||= []
  end

  attr_reader :body
end
