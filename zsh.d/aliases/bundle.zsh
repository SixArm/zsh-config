# Bundle aliases

# bi => bundle install with best isolation options
alias bi='bundle install --binstubs --path vendor/bundle'
alias bi-dev='RAILS_ENV=development bundle install --binstubs --path vendor/bundle --without ""'
alias bi-test='RAILS_ENV=test bundle install --binstubs --path vendor/bundle --without ""'
alias bi-pro='RAILS_ENV=production bundle install --binstubs --path vendor/bundle --without development test guard jasmine quality'

# bx  => bundle exec
alias bx='bundle exec'
alias bxd='RAILS_ENV=development bundle exec'
alias bxt='RAILS_ENV=test bundle exec'
alias bxp='RAILS_ENV=production bundle exec'

