import pytest

from app.app import create_app


@pytest.fixture
def app():
    """Create application for the tests."""
    _app = create_app("tests.settings")
    # _app.logger.setLevel(logging.CRITICAL)
    ctx = _app.test_request_context()
    ctx.push()

    yield _app

    ctx.pop()
