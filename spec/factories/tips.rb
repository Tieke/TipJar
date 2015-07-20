random_urls = [
  "http://www.google.com/",
  "http://www.facebook.com/",
  "http://www.youtube.com/",
  "http://www.yahoo.com/",
  "http://www.baidu.com/",
  "http://www.amazon.com/",
  "http://www.wikipedia.org/",
  "http://www.taobao.com/",
  "http://www.twitter.com/",
  "http://www.qq.com/",
  "http://www.google.co.in/",
  "http://www.live.com/",
  "http://www.sina.com.cn/",
  "http://www.linkedin.com/",
  "http://www.weibo.com/",
  "http://www.yahoo.co.jp/",
  "http://www.tmall.com/",
  "http://www.ebay.com/",
  "http://www.google.co.jp/",
  "http://www.blogspot.com/",
  "http://www.yandex.ru/",
  "http://www.google.de/",
  "http://www.vk.com/",
  "http://www.hao123.com/",
  "http://www.bing.com/",
  "http://www.t.co/",
  "http://www.msn.com/",
  "http://www.google.co.uk/",
  "http://www.amazon.co.jp/"
]

FactoryGirl.define do
  factory :tip do
    url random_urls.sample
    amount 0.01
    message "Awesome photo"
    tippee
    tipper
  end

end
