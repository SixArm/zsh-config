# Bundle aliases

# bi => bundle install with best isolation options
alias bi='bundle install --path vendor/bundle --binstubs vendor/bundle/binstubs'
alias bi-d='RAILS_ENV=development bundle install --path vendor/bundle --binstubs vendor/bundle/binstubs --without ""'
alias bi-t='RAILS_ENV=test bundle install --path vendor/bundle --binstubs vendor/bundle/binstubs --without ""'
alias bi-p='RAILS_ENV=production bundle install --path vendor/bundle --binstubs vendor/bundle/binstubs --without development test guard jasmine quality'

# bx  => bundle exec
alias bx='bundle exec'
alias bx-d='RAILS_ENV=development bundle exec'
alias bx-t='RAILS_ENV=test bundle exec'
alias bx-p='RAILS_ENV=production bundle exec'
