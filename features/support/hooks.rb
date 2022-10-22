# frozen_string_literal: true

After do |scenario|
  scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
  if scenario.failed?
    take_screenshot(scenario_name.downcase!, 'Failed')
  else
    take_screenshot(scenario_name.downcase!, 'Passed')
  end
end

at_exit do
  ReportBuilder.input_path = 'report/json/cucumber.json'
  ReportBuilder.configure do |config|
    config.report_types = %i[json html]
    config.report_path = 'reports/run'
    options = {
      report_title: 'Automation - Template Tests',
      color: 'light-blue',
      html_report_path: "report/relatorio/relatorio_testes_#{Time.now.strftime('%d_%m_%Y_%H_%M_%S')}", # Translate to english
      json_path: 'report/json/cucumber.json',
      additional_info: {  'Version' => '1.0.0',
                          'Browser' => BROWSER,
                          'Environment' => ENVIRONMENT,
                          'Date execution' => Time.now.strftime('%d/%m/%Y %H:%M:%S') #getlocal(00:00)
                       }
    }
    ReportBuilder.build_report options
  end
end
