# Macros to automatically login
module AuthenticationMacros
  def login_player
    let(:user) do
      FactoryGirl.create(:user, role: :player)
    end

    login_with_user
  end

  def login_listmod
    let(:user) do
      FactoryGirl.create(:user, role: :listmod)
    end

    login_with_user
  end

  def login_admin
    let(:user) do
      FactoryGirl.create(:user, role: :admin)
    end

    login_with_user
  end

  private

  def login_with_user
    before do
      @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Token.encode_credentials(user.token)
    end
  end
end
