# import pytest

from app import create_app


def test_create_app():
    assert create_app({"DEBUG": True, "TESTING": True})
