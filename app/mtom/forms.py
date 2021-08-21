from typing import Any, List, Tuple

from flask_wtf import FlaskForm
from wtforms.fields import HiddenField, SelectField
from wtforms.validators import DataRequired

from app.db import DTOBase


class RelFormBase(FlaskForm):

    base_item = HiddenField()

    def to_choice_list(self, items: List[DTOBase]) -> List[Tuple[DTOBase, Any]]:
        """
        Takes a list of DTOBase objects and converts them into a choice list for
        the relationship forms
        """
        return [(item.get_id(), item.get_display_value()) for item in items]

    def set_base_val(self, item: DTOBase) -> None:
        """Sets the value of the DTOBase object"""
        self.base_item.data = item


class RelAddForm(RelFormBase):

    _choice_list = [("", "")]

    to_add = SelectField("Please select a Record to add", choices=_choice_list)

    def validate(self):
        initial_validation = super().validate()
        print(f"Chosen value is: {self.to_add.data}", flush=True)
        print(f"Form is valid: {initial_validation}", flush=True)
        print(f"Form errors: {self.errors}", flush=True)
        if not self.to_add.data or self.to_add.data is None:
            self.to_add.errors.append("Please select a value")
            return False
        return initial_validation

    def set_choice_list(self, choice_list: List[Tuple[DTOBase, Any]]) -> None:
        self._choice_list = self._choice_list + self.to_choice_list(choice_list)
        self.to_add.choices = self._choice_list


class RelDeleteForm(RelFormBase):

    _choice_list = [("", "")]

    to_del = SelectField(
        "Please select a record to remove",
        validators=[DataRequired()],
        choices=_choice_list,
    )

    def set_choice_list(self, choice_list: List[Tuple[DTOBase, Any]]) -> None:
        self._choice_list = self._choice_list + self.to_choice_list(choice_list)
        self.to_del.choices = self._choice_list
