# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#data_uri_for_playground' do
    it 'should start with a data scheme prefix and the html MIME type' do
      playground = build(:playground)
      result = helper.data_uri_for_playground(playground)
      expect(result).to start_with('data:text/html;charset=utf-8,')
    end

    it 'should contain html if given html' do
      html = '<h1>HTML</h1>'
      playground = build(:playground, html: html)
      result = helper.data_uri_for_playground(playground)
      expect(result).to include(URI.encode(html))
    end

    it 'should contain css if given html' do
      css = 'body { color: chartreuse; }'
      playground = build(:playground, css: css)
      result = helper.data_uri_for_playground(playground)
      expect(result).to include(URI.encode("<style>#{css}</style>"))
    end

    it 'should contain js if given js' do
      js = "console.log('Hello');"
      playground = build(:playground, js: js)
      result = helper.data_uri_for_playground(playground)
      expect(result).to include(URI.encode("<script>#{js}</script>"))
    end
  end
end
