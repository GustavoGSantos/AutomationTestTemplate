# frozen_string_literal: true

# Module to take screenshot and sabe the path to the image
module Helper
  def take_screenshot(file_name, result)
    file_path = "report/screenshots/test_#{result}"
    img = "#{file_path}/#{file_name}_#{Time.now.strftime('%d_%m_%Y_%H_%M_%S')}.png"
    page.save_screenshot(img)
    attach(img, 'image/png')
    # In case you are using Windows use the code above

    # In case you are using MacOs use the code below
    # file_path = File.join("report/screenshots/test_#{result}", "#{file_name}_#{Time.now.strftime('%d_%m_%Y_%H_%M_%S')}.png")
    # page.driver.browser.save_screenshot file_path
    # base64_img = Base64.encode64(File.open(file_path, 'r:UTF-8', &:read))
    # attach(base64_img, 'image/png;base64')
  end
end
