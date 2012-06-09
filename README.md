speech news
===========
Speech Google News. [sample(mp3)](https://raw.github.com/shokai/speech-news/master/sample.mp3)


Install
-------

    % git clone git://github.com/shokai/speech-news.git
    % cd speech-news
    % gem install bundler
    % bundle install --path vendor/bundle


Read News
---------

    % ruby -Ku speech_news.rb --help
    % ruby -Ku speech_news.rb
    % ruby -Ku speech_news.rb -say "tools/gsay"


Add News Source
---------------

Put .rb file into "plugins" directory. See "plugins/google.rb"


LICENSE:
--------
(The MIT License)

Copyright (c) 2012 Sho Hashimoto

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
