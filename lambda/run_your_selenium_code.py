from selenium import webdriver
from selenium.webdriver.chrome.options import Options


def setup_driver():
    options = Options()
    options.binary_location = '/opt/headless-chromium'
    options.add_experimental_option('w3c', True)  # https://github.com/SeleniumHQ/selenium/issues/9978
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--single-process')
    options.add_argument('--disable-dev-shm-usage')
    return webdriver.Chrome('/opt/chromedriver', options=options)


def teardown_driver(driver):
    driver.close()
    driver.quit()


def handler(event, context):
    uri = event['URI']
    driver = setup_driver()

    # YOUR CODE HERE

    driver.set_window_size(1600, 1040)
    driver.get(uri)
    message = f"Page title was {driver.title}"
    teardown_driver(driver)
    print(message)  # gets logged in CloudWatch Logs
    return {"statusCode": 200, "body": message}
