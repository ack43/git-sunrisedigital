# README

1. Don't forget to run "bin/bundle-audit" to check for vulnerable! Update gems if required
2. Checkout to another branch, make pull request and merge it (don't push to master directly!)
3. Check the .env.example and config/deploy/production.rb.example. Update it according to the production server:
   `mv .env.example .env`
   `mv config/deploy/production.rb.example config/deploy/production.rb`
4. Add your ssh-keys to the server (https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-2)
5. Push .env variables to the remote server
   `nano /home/deploy/myapp/.rbenv-vars` or `vi /home/deploy/myapp/.rbenv-vars`
6. Type `cap production deploy` to deploy the app on a remote server. It will:
   1. Fetch the code from the github-repo mentioned in `config/deploy/production.rb`
   2. Create temp dirs (find it the `config/deploy.rb`)
   3. Run `bundle install`
   4. Run the `passenger`
7. Checkout the IP or web-server to see the app