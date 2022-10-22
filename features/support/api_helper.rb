# frozen_string_literal: true

Dir[File.join(File.dirname(__FILE__), '../Apis/*_api.rb')].sort.each{ |file| require file }

# Modulo para setar a variaveis globais que serao usadas para chamar os metodos nos aquivos do step_definition
module Api
  def buscar_cep
    @buscar_cep ||= BuscarCep.new
  end
end
