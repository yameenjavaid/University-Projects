# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: exchange.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf.internal import enum_type_wrapper
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor.FileDescriptor(
  name='exchange.proto',
  package='',
  syntax='proto3',
  serialized_options=_b('\n\022exchange.proto_outB\rCurrencyProtoP\001\242\002\003HLW'),
  serialized_pb=_b('\n\x0e\x65xchange.proto\"`\n\x11\x43urrencyArguments\x12(\n\x11ReferenceCurrency\x18\x01 \x01(\x0e\x32\r.CurrencyType\x12!\n\nCurrencies\x18\x02 \x03(\x0e\x32\r.CurrencyType\"6\n\x08\x43urrency\x12\x1b\n\x04Type\x18\x01 \x01(\x0e\x32\r.CurrencyType\x12\r\n\x05Value\x18\x02 \x01(\x01\",\n\x0e\x43urrencyResult\x12\x1a\n\x07Results\x18\x01 \x03(\x0b\x32\t.Currency*D\n\x0c\x43urrencyType\x12\x07\n\x03PLN\x10\x00\x12\x07\n\x03\x45UR\x10\x01\x12\x07\n\x03USD\x10\x02\x12\x07\n\x03\x43HF\x10\x03\x12\x07\n\x03GBP\x10\x04\x12\x07\n\x03JPY\x10\x05\x32G\n\x10\x43urrencyExchange\x12\x33\n\x08GetValue\x12\x12.CurrencyArguments\x1a\x0f.CurrencyResult\"\x00\x30\x01\x42+\n\x12\x65xchange.proto_outB\rCurrencyProtoP\x01\xa2\x02\x03HLWb\x06proto3')
)

_CURRENCYTYPE = _descriptor.EnumDescriptor(
  name='CurrencyType',
  full_name='CurrencyType',
  filename=None,
  file=DESCRIPTOR,
  values=[
    _descriptor.EnumValueDescriptor(
      name='PLN', index=0, number=0,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='EUR', index=1, number=1,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='USD', index=2, number=2,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='CHF', index=3, number=3,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='GBP', index=4, number=4,
      serialized_options=None,
      type=None),
    _descriptor.EnumValueDescriptor(
      name='JPY', index=5, number=5,
      serialized_options=None,
      type=None),
  ],
  containing_type=None,
  serialized_options=None,
  serialized_start=218,
  serialized_end=286,
)
_sym_db.RegisterEnumDescriptor(_CURRENCYTYPE)

CurrencyType = enum_type_wrapper.EnumTypeWrapper(_CURRENCYTYPE)
PLN = 0
EUR = 1
USD = 2
CHF = 3
GBP = 4
JPY = 5



_CURRENCYARGUMENTS = _descriptor.Descriptor(
  name='CurrencyArguments',
  full_name='CurrencyArguments',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='ReferenceCurrency', full_name='CurrencyArguments.ReferenceCurrency', index=0,
      number=1, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='Currencies', full_name='CurrencyArguments.Currencies', index=1,
      number=2, type=14, cpp_type=8, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=18,
  serialized_end=114,
)


_CURRENCY = _descriptor.Descriptor(
  name='Currency',
  full_name='Currency',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='Type', full_name='Currency.Type', index=0,
      number=1, type=14, cpp_type=8, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='Value', full_name='Currency.Value', index=1,
      number=2, type=1, cpp_type=5, label=1,
      has_default_value=False, default_value=float(0),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=116,
  serialized_end=170,
)


_CURRENCYRESULT = _descriptor.Descriptor(
  name='CurrencyResult',
  full_name='CurrencyResult',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='Results', full_name='CurrencyResult.Results', index=0,
      number=1, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=172,
  serialized_end=216,
)

_CURRENCYARGUMENTS.fields_by_name['ReferenceCurrency'].enum_type = _CURRENCYTYPE
_CURRENCYARGUMENTS.fields_by_name['Currencies'].enum_type = _CURRENCYTYPE
_CURRENCY.fields_by_name['Type'].enum_type = _CURRENCYTYPE
_CURRENCYRESULT.fields_by_name['Results'].message_type = _CURRENCY
DESCRIPTOR.message_types_by_name['CurrencyArguments'] = _CURRENCYARGUMENTS
DESCRIPTOR.message_types_by_name['Currency'] = _CURRENCY
DESCRIPTOR.message_types_by_name['CurrencyResult'] = _CURRENCYRESULT
DESCRIPTOR.enum_types_by_name['CurrencyType'] = _CURRENCYTYPE
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

CurrencyArguments = _reflection.GeneratedProtocolMessageType('CurrencyArguments', (_message.Message,), dict(
  DESCRIPTOR = _CURRENCYARGUMENTS,
  __module__ = 'exchange_pb2'
  # @@protoc_insertion_point(class_scope:CurrencyArguments)
  ))
_sym_db.RegisterMessage(CurrencyArguments)

Currency = _reflection.GeneratedProtocolMessageType('Currency', (_message.Message,), dict(
  DESCRIPTOR = _CURRENCY,
  __module__ = 'exchange_pb2'
  # @@protoc_insertion_point(class_scope:Currency)
  ))
_sym_db.RegisterMessage(Currency)

CurrencyResult = _reflection.GeneratedProtocolMessageType('CurrencyResult', (_message.Message,), dict(
  DESCRIPTOR = _CURRENCYRESULT,
  __module__ = 'exchange_pb2'
  # @@protoc_insertion_point(class_scope:CurrencyResult)
  ))
_sym_db.RegisterMessage(CurrencyResult)


DESCRIPTOR._options = None

_CURRENCYEXCHANGE = _descriptor.ServiceDescriptor(
  name='CurrencyExchange',
  full_name='CurrencyExchange',
  file=DESCRIPTOR,
  index=0,
  serialized_options=None,
  serialized_start=288,
  serialized_end=359,
  methods=[
  _descriptor.MethodDescriptor(
    name='GetValue',
    full_name='CurrencyExchange.GetValue',
    index=0,
    containing_service=None,
    input_type=_CURRENCYARGUMENTS,
    output_type=_CURRENCYRESULT,
    serialized_options=None,
  ),
])
_sym_db.RegisterServiceDescriptor(_CURRENCYEXCHANGE)

DESCRIPTOR.services_by_name['CurrencyExchange'] = _CURRENCYEXCHANGE

# @@protoc_insertion_point(module_scope)