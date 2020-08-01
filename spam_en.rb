require "selenium-webdriver"
require 'xdo/keyboard'
require 'xdo/mouse'
require 'xdo/xwindow'

driver = Selenium::WebDriver.for :chrome
driver.manage().window().maximize()

# Acessing the Discord page
driver.navigate.to "https://discord.com/"

# Clicking the button that leads to login page
login = driver.find_element(xpath: "//a[@href='//discord.com/login']")
login.click

# Logging to your discord account
email = driver.find_element(name: 'email')
password = driver.find_element(name: 'password')
email.send_keys "your@email.com"
password.send_keys "yourpassword"
password.submit
sleep 15

# Acessing the Server that you want to spam
server = driver.find_element(xpath: "//a[@aria-label='Your Server Name']")
server.click
sleep 5

# Acessing the text channel you will spam
text_channel = driver.find_element(xpath: "//div[@aria-label='yourvoicechatname (text channel)']")
text_channel.click

repeat = 10 # How many messages you want do send
cooldown = 5 # The time in seconds between the messages

repeat.times do
  XDo::Keyboard.type('Message to be spammed', 0)
  XDo::Keyboard.return
  sleep cooldown
end