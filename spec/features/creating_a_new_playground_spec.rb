# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'Creating a new Playground', js: true do
  scenario 'as a visitor' do
    html = '<h1>Mathematical!</h1>'
    css = 'h1 { color: rgb(127, 255, 0); }'
    js = "window.coolGlobalVariable = 'COOL_GLOBAL_VARIABLE';"

    visit root_path

    expect(page).to have_current_path(new_playground_path)

    playground_create_attributes = attributes_for(:playground, html: html,
                                                               css: css,
                                                               js: js)

    fill_form :playground, playground_create_attributes
    click_on submit(:playground)

    expect(page).to have_content t('playgrounds.create.success')
    expect(page).to have_current_path(%r{\A\/playgrounds\/[a-zA-Z0-9]+\/edit\Z})

    within_frame output_frame do
      expect(page).to have_css('h1', text: 'Mathematical!')

      color = page.evaluate_script(<<~SCRIPT)
        getComputedStyle(document.querySelector('h1'))['color']
      SCRIPT
      expect(color).to eq('rgb(127, 255, 0)')

      cool_global_variable = page.evaluate_script(<<~SCRIPT)
        window.coolGlobalVariable;
      SCRIPT
      expect(cool_global_variable).to eq('COOL_GLOBAL_VARIABLE')
    end

    expect(page.field_labeled(input(:playground, :html)).value).to eq(html)
    expect(page.field_labeled(input(:playground, :css)).value).to eq(css)
    expect(page.field_labeled(input(:playground, :js)).value).to eq(js)

    fill_in input(:playground, :html), with: '<h2>Updated Title</h2>'
    click_on submit(:playground, :update)

    expect(page.field_labeled(input(:playground, :html)).value).to eq('<h2>Updated Title</h2>')
    within_frame output_frame do
      expect(page).to have_css('h2', text: 'Updated Title')
    end
  end

  def output_frame
    find('[data-role=playground__output]')
  end
end
