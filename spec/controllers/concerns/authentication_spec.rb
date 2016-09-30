require 'rails_helper'

describe Authentication do
  class FakeAuthenticationController
    include Authentication

    def session
      @session ||= {}
    end
  end

  subject { FakeAuthenticationController.new }

  it "creates a visitor if there is not a token in the session" do
    visitor = double
    allow(User::Token).to receive(:new).and_return("new_token")
    allow(Visitor).to receive(:create).with({remember_token: "new_token"}).and_return(visitor)

    result = subject.current_user

    expect(result).to be(visitor)
    expect(subject.session[:remember_token]).to eq("new_token")
  end

  it "finds an existing visitor if there is a token in the session" do
    subject.session[:remember_token] = "existing_token"
    visitor = double
    expect(Visitor).to receive(:find_by!).with({remember_token: "existing_token"}).and_return(visitor)

    result = subject.current_user

    expect(result).to be(visitor)
  end
end
