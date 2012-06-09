speech news
===========
Speech Google News. [sample(mp3)](https://raw.github.com/shokai/speech-news/master/sample.mp3)


Install Dependencies
--------------------

    % gem install bundler
    % bundle install --path vendor/bundle


Read News
---------

    % ruby -Ku speech_news.rb --help
    % ruby -Ku speech_news.rb
    % ruby -KU speech_news.rb -say "tools/gsay"


Add News Source
---------------

Put .rb file into "plugins" directory. See "plugins/google.rb"
