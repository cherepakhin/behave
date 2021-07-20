Feature: Проверка echo

  Scenario: request to url
    Given a request url http://127.0.0.1:8080/api/echo/bbb
    When the request sends GET
    Then Получен текст bbb

  Scenario: echo/aaa
    Given Запрос на persist /echo/aaa
    When the request sends GET
    Then Получен текст aaa

  Scenario Outline: echo tables
    Given Запрос на persist /echo/<message>
    When the request sends GET
    Then the response status is OK
    And Получен текст <out_message>
    Examples: Messages
      | message | out_message |
      | Red     | Red         |
      | Green   | Green       |

  @test_post
  Scenario: test_post
    Given Запрос на persist /test_post
    And a request json payload
          """
          {"id": 1, "name": "vasi"}
          """
    When the request sends POST
    Then the response status is OK
    And the response json matches
        """
        {
          "type": "object",
          "properties": {
            "id": {"type": "number"},
            "name": {"type": "string"}
          },
          "required": ["id", "name"]
        }
        """
    And the response json at $.id is equal to 1
    And Получена {"id":1,"name":"vasi"}

  @test_post
  Scenario: test_post2
    Given Запрос на persist /test_post
    And a request json payload
          """
          {"id": 2, "name": "name_2"}
          """
    When the request sends POST
    Then the response status is OK
    And the response json matches
        """
        {
          "type": "object",
          "properties": {
            "id": {"type": "number"},
            "name": {"type": "string"}
          },
          "required": ["id", "name"]
        }
        """
    And the response json at $.id is equal to 2
    And Получена {"id":2,"name":"name_2"}

  @test_post
  Scenario: test_post tables
    Given Запрос на persist /test_post
    And a request json payload
      """
      {"id": 1, "name": "vasi"}
      """
    When the request sends POST
    Then the response status is OK
    And the response json matches
        """
        {
          "type": "object",
          "properties": {
            "id": {"type": "number"},
            "name": {"type": "string"}
          },
          "required": ["id", "name"]
        }
        """
    And the response json at $.id is equal to 1
    And Получена {"id":1,"name":"vasi"}
