== GatsBee

[![Build Status](https://travis-ci.org/dgrosenblatt/gatsbee.svg)](https://travis-ci.org/dgrosenblatt/gatsbee) [![Coverage Status](https://img.shields.io/coveralls/dgrosenblatt/gatsbee.svg)](https://coveralls.io/r/dgrosenblatt/gatsbee) [![Code Climate](https://codeclimate.com/github/dgrosenblatt/gatsbee/badges/gpa.svg)](https://codeclimate.com/github/dgrosenblatt/gatsbee)

GatsBee the busy bee wants to help you organize your book club.

Create and join clubs, and comment on books.

Book suggestions provided via the Amazon product advertising API (and the vacuum gem).

Meetings can be created in google calendars of book club members with the chronic gem for date string parsing and the google calendar api.

You'll need postgres, google credentials, and aws credentials to run the app locally in dev. Ngrok can be used for google sign in.
