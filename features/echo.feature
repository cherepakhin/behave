Feature: Проверка echo

  Scenario: echo/aaa
    Given Запрос на persist /echo/aaa
    When the request sends GET
    Then Получен текст aaa
