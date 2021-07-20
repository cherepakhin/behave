from behave_restful.lang import *

@given('Запрос на persist {test_url}')
def step_impl(context,test_url):
    context.execute_steps('given a request url {}{}'.format(context.settings['persist_host'],test_url))

@then('Получена {mes}')
def step_impl(context,mes):
    assert context.response.status_code == 200
    r_mes=context.response.text
    assert context.response.text == mes

@then('Получен какой-то json')
def step_impl(context):
    assert context.response.status_code == 200
    print(context.response.text)

@then('Получен текст {text}')
def step_impl(context,text):
    assert context.response.status_code == 200
    assert context.response.text == text
