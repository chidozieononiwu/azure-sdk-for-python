# coding=utf-8
# --------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.
# Code generated by Microsoft (R) AutoRest Code Generator.
# Changes may cause incorrect behavior and will be lost if the code is regenerated.
# --------------------------------------------------------------------------

from enum import Enum, EnumMeta
from six import with_metaclass

class _CaseInsensitiveEnumMeta(EnumMeta):
    def __getitem__(self, name):
        return super().__getitem__(name.upper())

    def __getattr__(cls, name):
        """Return the enum member matching `name`
        We use __getattr__ instead of descriptors or inserting into the enum
        class' __dict__ in order to support `name` and `value` being both
        properties for enum members (which live in the class' __dict__) and
        enum members themselves.
        """
        try:
            return cls._member_map_[name.upper()]
        except KeyError:
            raise AttributeError(name)


class ContentType(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """Content type for upload
    """

    APPLICATION_PDF = "application/pdf"  #: Content Type 'application/pdf'.
    IMAGE_JPEG = "image/jpeg"  #: Content Type 'image/jpeg'.
    IMAGE_PNG = "image/png"  #: Content Type 'image/png'.
    IMAGE_TIFF = "image/tiff"  #: Content Type 'image/tiff'.

class ContentTypeAutoGenerated(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """Content type for upload
    """

    APPLICATION_PDF = "application/pdf"  #: Content Type 'application/pdf'.
    IMAGE_BMP = "image/bmp"  #: Content Type 'image/bmp'.
    IMAGE_JPEG = "image/jpeg"  #: Content Type 'image/jpeg'.
    IMAGE_PNG = "image/png"  #: Content Type 'image/png'.
    IMAGE_TIFF = "image/tiff"  #: Content Type 'image/tiff'.

class FieldValueSelectionMark(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """Selection mark value.
    """

    SELECTED = "selected"
    UNSELECTED = "unselected"

class FieldValueType(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """Semantic data type of the field value.
    """

    STRING = "string"
    DATE = "date"
    TIME = "time"
    PHONE_NUMBER = "phoneNumber"
    NUMBER = "number"
    INTEGER = "integer"
    ARRAY = "array"
    OBJECT = "object"
    SELECTION_MARK = "selectionMark"

class KeyValueType(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """Semantic data type of the key value element.
    """

    STRING = "string"
    SELECTION_MARK = "selectionMark"

class Language(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """Language code
    """

    EN = "en"
    ES = "es"
    DE = "de"
    FR = "fr"
    IT = "it"
    NL = "nl"
    PT = "pt"
    ZH_HANS = "zh-Hans"

class LengthUnit(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """The unit used by the width, height and boundingBox properties. For images, the unit is "pixel".
    For PDF, the unit is "inch".
    """

    PIXEL = "pixel"
    INCH = "inch"

class Locale(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):

    EN_AU = "en-AU"
    EN_CA = "en-CA"
    EN_GB = "en-GB"
    EN_IN = "en-IN"
    EN_US = "en-US"

class ModelStatus(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """Status of the model.
    """

    CREATING = "creating"
    READY = "ready"
    INVALID = "invalid"

class OperationStatus(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """Status of the queued operation.
    """

    NOT_STARTED = "notStarted"
    RUNNING = "running"
    SUCCEEDED = "succeeded"
    FAILED = "failed"

class SelectionMarkState(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """State of the selection mark.
    """

    SELECTED = "selected"
    UNSELECTED = "unselected"

class TextStyle(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """The text line style name, including handwriting and other.
    """

    OTHER = "other"
    HANDWRITING = "handwriting"

class TrainStatus(with_metaclass(_CaseInsensitiveEnumMeta, str, Enum)):
    """Status of the training operation.
    """

    SUCCEEDED = "succeeded"
    PARTIALLY_SUCCEEDED = "partiallySucceeded"
    FAILED = "failed"
