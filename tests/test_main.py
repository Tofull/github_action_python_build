from any_app.main import main


def test_main():
    output = main()
    expected_output = "Hello world"
    assert output == expected_output

