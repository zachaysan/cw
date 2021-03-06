![Yearhh](http://farm4.staticflickr.com/3107/2820420847_fc3f8196cf_z.jpg)

Photo by [country_boy_shane](http://www.flickr.com/photos/shanegorski/)

## Delayed until out of beta
- Make more RESTful URIs, instead of relying on id for everything
- Expose the multi-user abilities through the front end
- Use UUIDs
- Check threat level of CSFR prevention removal on access_token
- Set up a basic account page

## Delayed until traction
- Set up a stripe account for payments -> Will use 30 day free model.
- Allow a domain owner to verify a URL so that we can be less paranoid about possible use in spam.

## To Start
```
redis-server &
bundle exec sidekiq &
rails s
```

## To Update Ember
Increment ember-source
rails generate ember:install --head

## Webhook - Consumer - Producer explanation

Since the design of Captain Webhooks is aimed to be painless for
multiple site management, one user can manage and own multiple 
"producers" (think, websites, or sub-domains, or autonomous robots).
For the beta release these might be called APIs or Servers. 

Say you ran guestlistapp.com but you wanted your trusty sidekick to
keep on top of the Captain Webhooks metrics. You could give him your
password, but that is so not pro.

Instead he makes an account, and you share the producer with him.
While he's running things you go off and start another project that
needs webhooks. No need to make another account with 
youremail+sigh@gmail.com, just create a new producer either through
the handy web interface or with the api itself.

Say after some time someone from a big company offers you stacks for
guestlistapp.com. No problem there! Just transfer the producer 
*ownership* to that big company's captain webhooks account. They can
then remove you and your newly wealthy buddy from the account.

So far so good. But why do consumers (the individual places you push 
webhooks to) belong to just one producer? Because it would make 
ownership management too complicated for very little benefit. What 
are the odds that you have multiple producers that all push the same
consumers? And even *if* that is the case, you can always get the 
consumer analytics through the API and tally them yourself. Or 
possibly even fork the captain webhooks ember app itself (although,
down that path I warn yee not to go).
