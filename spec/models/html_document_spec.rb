# frozen_string_literal: true
RSpec.describe HTMLDocument do
  describe '#to_s' do
    it 'should be an empty document if given no arguments' do
      doc = HTMLDocument.new
      result = doc.to_s

      expect(result).to eq <<~EOS
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset="utf-8">
          </head>
          <body>
          </body>
        </html>
      EOS
    end

    it 'should allow adding content to the head' do
      doc = HTMLDocument.new
      doc.append_style_tag_to_head 'body { color: chartreuse; }'
      doc.append_script_tag_to_head 'console.log("hello");'

      result = doc.to_s

      expect(result).to eq <<~EOS
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset="utf-8">
            <style>body { color: chartreuse; }</style><script>console.log("hello");</script>
          </head>
          <body>
          </body>
        </html>
      EOS
    end

    it 'should accept content for the body' do
      doc = HTMLDocument.new(body: 'BODY')
      result = doc.to_s

      expect(result).to eq <<~EOS
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset="utf-8">
          </head>
          <body>
            BODY
          </body>
        </html>
      EOS
    end
  end
end
