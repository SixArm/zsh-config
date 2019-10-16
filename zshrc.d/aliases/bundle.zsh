# Bundle aliases

# bundle install, with our preferred isolation options
alias bundle-i='bundle install --path vendor/bundle --binstubs vendor/bundle/binstubs'
alias bundle-i-d='RAILS_ENV=development bundle install --path vendor/bundle --binstubs vendor/bundle/binstubs --without ""'
alias bundle-i-t='RAILS_ENV=test bundle install --path vendor/bundle --binstubs vendor/bundle/binstubs --without ""'
alias bundle-i-p='RAILS_ENV=production bundle install --path vendor/bundle --binstubs vendor/bundle/binstubs --without development test guard jasmine quality'

# bundle exec, with our preferred isolation options
alias bundle-x='bundle exec'
alias bundle-x-d='RAILS_ENV=development bundle exec'
alias bundle-x-t='RAILS_ENV=test bundle exec'
alias bundle-x-p='RAILS_ENV=production bundle exec'
