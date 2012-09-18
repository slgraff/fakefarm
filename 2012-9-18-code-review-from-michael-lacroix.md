## Notes from Michael LaCroix Code Review

1. Added a development group with 'quiet_assets' and 'thin'
2. added bourbon gem
3. changed application stylesheet to .scss & added @imports 
4. added   <%= javascript_include_tag "html5" %><![endif]--> to application.html
5. moved google analytics to bottom of the file.
6. changes to config/environments/production.rb
-  # config.assets.precompile += %w( search.js )
+  config.assets.precompile += %w( html5.js )
7. Added ProcFile
web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
8. Added new file; config/initializers/new_relic.rb
# Ensure the agent is started using Unicorn This is needed when using Unicorn and preload_app is not set to true. See http://support.newrelic.com/kb/troubleshooting/unicorn-no-data
NewRelic::Agent.after_fork(:force_reconnect => true) if defined? Unicorn
9. Added new relic license to config/newrelic.yml
10. Added config/unicorn.rb
worker_processes 3 # amount of unicorn workers to spin up
timeout 30         # restarts workers that hang for 30 seconds
11. What does uglifier do?
12. What can i do with 'jquery-rails?'
