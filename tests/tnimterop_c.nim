import std/unittest
import nimterop/cimport

cDebug()

cDefine("FORCE")
cIncludeDir "$projpath/include"
cAddSearchDir "$projpath/include"
cCompile cSearchPath("test.c")
cImport cSearchPath "test.h"

check TEST_INT == 512
check TEST_FLOAT == 5.12
check TEST_HEX == 0x512

var
  pt: PRIMTYPE
  ct: CUSTTYPE

  s: STRUCT1
  s2: STRUCT2
  s3: STRUCT3
  s4: STRUCT4

  e: ENUM
  e2: ENUM2 = enum5
  e3: Enum_testh1 = enum7
  e4: ENUM4 = enum11

  vptr: VOIDPTR
  iptr: INTPTR

  u: UNION1
  u2: UNION2

pt = 3
ct = 4

s.field1 = 5
s2.field1 = 6
s3.field1 = 7

e = enum1
e2 = enum4

u2.field2 = 'c'

check test_call_int() == 5
check test_call_param(5).field1 == 5
check test_call_param2(5, s2).field1 == 11
check test_call_param3(5, s).field1 == 10
check test_call_param4(e) == e2
check test_call_param5(5.0).field2 == 5.0
check test_call_param6(u2) == 'c'
u.field1 = 4
check test_call_param7(u) == 4

check e3 == enum7
check e4 == enum11

cAddStdDir()
