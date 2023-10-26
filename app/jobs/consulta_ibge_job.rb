require 'net/http'
require 'openssl'
require 'json'

class ConsultaIbgeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # IBGE
    uri = URI('https://servicodados.ibge.gov.br/api/v1/localidades/distritos')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    # Desativar verificação SSL - LEMBRE-SE, isto é para desenvolvimento/teste somente!
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(uri.request_uri)

    # Realiza a chamada GET para a URI da API
    response = http.request(request)

    Distrito.destroy_all
    # Verifica se a resposta da API foi bem-sucedida (código de status HTTP 200)
    if response.code == "200"
      # Converte o JSON de resposta em um objeto Ruby
      distritos = JSON.parse(response.body)
      distritos.each do |distrito|
        Distrito.create(nome: distrito["nome"])
      end
    else
      # Se a resposta não for bem-sucedida, você pode lidar com erros aqui
      Rails.logger.error("Erro na chamada da API. Código de status: #{response.code}")
    end
  end
end
