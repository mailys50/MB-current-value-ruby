require 'json'
require 'rest-client'
require 'net/http'
require 'date'
# require 'date'

# creación de dominio e id
dominio = 'https://fintual.cl/api/real_assets/'
ids = {}
ids['id1'] = '15077'
ids['id2'] = '188'
ids['id3'] = '187'
ids['id4'] = '186'

# intereses anuales
rate_year = {}
rate_year['1'] = 0.0
rate_year['2'] = 0.1
rate_year['3'] = 0.2
rate_year['4'] = 0.7

# intereses diaria
rates_uno = rate_year['1'] / 360
rates_dos = rate_year['2'] / 360
rates_tres = rate_year['3'] / 360
rates_cuatro = rate_year['4'] / 360

# intereses mensuales
rates_m_uno = rate_year['1'] / 12
rates_m_dos = rate_year['2'] / 12
rates_m_tres = rate_year['3'] / 12
rates_m_cuatro = rate_year['4'] / 12

# puts rates_uno
# puts rates_dos
# puts rates_tres
# puts rates_cuatro
# Fecha actual
$time_now = Time.now.strftime('%d/%m/%Y')

# pedir Fecha de inversión
puts 'hola! ¿Indique fecha de inversión ? '
$date = gets.chomp

# pedir monto de inversión
puts 'hola! ¿Indique monto de inversión?'
$monto = gets.chomp

# pedir tipo de inversión
puts 'hola! ¿Indique tipo de inversión? marque 1 = veryConservativeStreep, 2 = conservativeClooney, 3 = moderatePitt, 4 = riskyNorris'
$rate_type = gets.chomp

# calculo del tiempo
date_uno = Date.parse $date
date_dos = Date.parse $time_now
$days = (date_dos - date_uno).to_i
$months = ((date_dos.year - date_uno.year) * 12).to_i + (date_dos.month - date_uno.month).to_i
$years = (date_dos.year - date_uno.year).to_i

# puts $days
# puts months
# puts years
# _______________veryConservativeStreep,________________________
if $rate_type == '1'
  url = dominio + ids['id1'] + '/days?to_date=' + $date
  response = RestClient.get url
  result = JSON.parse response.to_str
  # obtener valor unitario de la acción
  price = result['data'][0]['attributes']['price']
  puts price
  # calculo del valor actual
  c = $monto.to_f
  i = rates_uno.to_f
  t = $days.to_f

  value_rate = c * i * t
  puts value_rate
  value_now_a = (c + value_rate).to_s
  puts 'tus acciones con el portafolio veryConservativeStreep tienen un valor de:' + value_now_a + ' pesos'
end
# _______________conservativeClooney________________________
if $rate_type == '2'
  url = dominio + ids['id2'] + '/days?from_date=' + $date + '&to_date=' + $time_now
  # url='https://fintual.cl/api/real_assets/188/days?from_date=2018-07-01&to_date='+ date
  response = RestClient.get url
  result = JSON.parse response.to_str

  price = result['data'][0]['attributes']['price']
  # obteniendo valor liquidativo

  puts price
  # calculo del valor actual
  c = $monto.to_f
  i = rates_dos.to_f
  t = $days.to_f

  value_rate = c * i * t
  puts value_rate
  value_now_b = (c + value_rate).to_s
  puts 'tus acciones con el portafolio conservativeClooney tienen un valor de:' + value_now_b + ' pesos'

end

# _______________moderatePitt,________________________
if $rate_type == '3'
  url = dominio + ids['id3'] + '/days?to_date=' + $date
  # url='https://fintual.cl/api/real_assets/187/days?to_date=' + $date
  response = RestClient.get url
  result = JSON.parse response.to_str
  # calculo del valor actual
  c = $monto.to_f
  i = rates_tres.to_f
  t = $days.to_f

  value_rate = c * i * t
  puts value_rate
  value_now_c = (c + value_rate).to_s
  puts 'tus acciones con el portafolio moderatePitt tienen un valor de:' + value_now_c + ' pesos'
end
# _______________riskyNorris________________________
if $rate_type == '4'
  url = dominio + ids['id4'] + '/days?from_date=' + $date
  # url='https://fintual.cl/api/real_assets/186/days?from_date=' + $date
  response = RestClient.get url
  result = JSON.parse response.to_str
  # calculo del valor actual
  c = $monto.to_f
  i = rates_tres.to_f
  t = $days.to_f

  value_rate = c * i * t
  puts value_rate
  value_now_d = (c + value_rate).to_s
  puts 'tus acciones con el portafolio riskyNorris tienen un valor de:' + value_now_d + ' pesos'

end
