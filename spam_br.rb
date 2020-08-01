require "selenium-webdriver"
require 'xdo/keyboard'
require 'xdo/mouse'
require 'xdo/xwindow'

driver = Selenium::WebDriver.for :chrome
driver.manage().window().maximize()

# Acessando a página do Discord
driver.navigate.to "https://discord.com/"

# Clicando no botão que leva à página de login
login = driver.find_element(xpath: "//a[@href='//discord.com/login']")
login.click

# Logando na conta do Discord
email = driver.find_element(name: 'email')
senha = driver.find_element(name: 'password')
email.send_keys "seu@email.com"
senha.send_keys "suasenha"
senha.submit
sleep 15

# Acessando o Servidor
servidor = driver.find_element(xpath: "//a[@aria-label='Nome do seu Servidor']")
servidor.click
sleep 5

# Acessando o canal de texto
chat_de_texto = driver.find_element(xpath: "//div[@aria-label='nomedoseucanaldetexto (canal de texto)']")
chat_de_texto.click

repita = 10 # Quantas vezes a mensagem vai ser mandadada
cooldown = 5 # Tempo entre as mensagens

repita.times do
  XDo::Keyboard.type('Mensagem a ser spammada', 0)
  XDo::Keyboard.return
  sleep cooldown
end