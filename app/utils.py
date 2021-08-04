"""Helper Utilities and decorators"""
from flask import flash


def flash_errors(form, category="warning"):
    """Flash all errors returned from a form"""
    for field, errors in form.errors.items():
        for error in errors:
            flash(f"{getattr(form, field).label.text} - {error}", category)
