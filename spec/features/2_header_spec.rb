require "rails_helper"

feature "Header:" do

  scenario "edit profile link is just username", points: 2 do
    user = create(:user)
    login_as(user, :scope => :user)

    visit "/"

    within('nav') do
      expect(page).to have_link(user.username, href: '/users/edit')
    end
  end

  scenario "no 'dummy' text in sign-out link", points: 1 do
    user = create(:user)
    login_as(user, :scope => :user)

    visit "/"

    within('nav') do
      expect(find(:xpath, "//a[@href='/users/sign_out']").text).not_to eq('Dummy Sign Out Link')
    end
  end

  scenario "if logged out, sign-up link should present", points: 1 do
    visit "/"

    within('nav') do
      expect(page).to have_link(nil, href: '/users/sign_up')
    end
  end

  scenario "if logged out, sign-in link should present", points: 1 do
    visit "/"

    within('nav') do
      expect(page).to have_link(nil, href: '/users/sign_in')
    end
  end

  scenario "if logged out, sign-out link should not present", points: 1 do
    visit "/"

    within('nav') do
      expect(page).not_to have_link(nil, href: '/users/sign_out')
    end
  end

  scenario "if logged out, edit link should not present", points: 1 do
    visit "/"

    within('nav') do
      expect(page).not_to have_link(nil, href: '/users/edit')
    end
  end

end
