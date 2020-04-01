# MercurySearch-CapstoneProject

Capstone project as part of microverse curriculum, creating a bot using slack API and spotify API.

<img src="https://drive.google.com/file/d/19tSdQXcqN5yiSrRX8UeGJwPFvEwMgtw-/view" width="100%">

> Slack's bot that search for songs and artists into spotify data base.

## How to use

- Create a custom space in slack and add a custom integration [addIntegration](https://eikovalabs.slack.com/apps/new/A0F7YS25R-bots)
- Create an account in spotify and get an ID [here](https://developer.spotify.com/console/)
- Grab an Authentication token [here](https://developer.spotify.com/console/get-search-item/)


<a href="https://www.loom.com/share/5b9a4f63676b4ae6bdffb18f69d2bcca"> <p>Home | Spotify for Developers - Watch Video</p> <img style="max-width:300px;" src="https://cdn.loom.com/sessions/thumbnails/5b9a4f63676b4ae6bdffb18f69d2bcca-with-play.gif"> </a>


- Type in your terminal:
- `export SLACK_API_TOKEN= <your slack token>` for store your token into an ENV variable
- `export SPOTIFY_API_TOKEN= <your spotify token>` for store your token into an ENV variable

- In your terminal write `bundle install` to install all gems
- For turn on the server locally type : `foreman start`

## How to test

- Write in your terminal `rspec` and automatically going to test.
- You don't need an auth token, VCR record an HTTP response and apply the testing part. 

## Built With

- Ruby

## Important Notes

- Sometimes in windows will not work, it's a compatibility problem with gems used in slack-ruby-bot framework
- All the files work with absolute paths stored in the $LOAD_PATH array, if you want to 'require' files use `require` instead of `require-relative`

## Authors

👤 **Eduardo Cruz**

- Github: [EdCrux](https://github.com/EdCrux)
- Twitter: [@Eduardo79973490](https://twitter.com/twitterhandle)
- Linkedin: [linkedin](www.linkedin.com/in/edcrux)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](lic.url) licensed.
