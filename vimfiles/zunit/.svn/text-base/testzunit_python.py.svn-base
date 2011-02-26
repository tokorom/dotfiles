import unittest
import zunit_python as z

class TestTestClass(unittest.TestCase):

  def setUp(self):
    pass

  def tearDown(self):
    pass

  def testSimple(self):
    ret = z.ZUnitParse("test")
    self.assertEquals( ret, 'could not complete.' )
  
  def testFunction(self):
    ret = z.matchedWithFunction("   test()   ")
    self.assertEquals( ret, '\tdef test(self):\n\t\tpass' )
    ret = z.matchedWithFunction("test( 1 )")
    self.assertEquals( ret, '\tdef test(self, int):\n\t\tpass' )
    ret = z.matchedWithFunction("test( 'abc' )")
    self.assertEquals( ret, '\tdef test(self, string):\n\t\tpass' )
    ret = z.matchedWithFunction('test( "abc" )')
    self.assertEquals( ret, '\tdef test(self, string):\n\t\tpass' )
    ret = z.matchedWithFunction("test(1, 2, 3 )")
    self.assertEquals( ret, '\tdef test(self, int, int, int):\n\t\tpass' )
    ret = z.matchedWithFunction("c.test(1, 2, 3 )")
    self.assertEquals( ret, '\tdef test(self, int, int, int):\n\t\tpass' )
    ret = z.matchedWithFunction("c.test(1,\n\t\t2,\r\n\t  3 )")
    self.assertEquals( ret, '\tdef test(self, int, int, int):\n\t\tpass' )
    ret = z.matchedWithFunction("if c.test(1, 2, 3 ):")
    self.assertEquals( ret, '\tdef test(self, int, int, int):\n\t\tpass' )
    ret = z.matchedWithFunction("c.parse('num=123456; expires=Sun, 10-Jun-2001 12:00:00 GMT; path=/HTTP/')")
    self.assertEquals( ret, '\tdef parse(self, string):\n\t\tpass' )
    ret = z.matchedWithFunction("c.parse('num=123456, \"test\"' , \"''\")")
    self.assertEquals( ret, '\tdef parse(self, string, string):\n\t\tpass' )
    ret = z.matchedWithFunction("c.parse('num=123456, \"test\"' , \"'1, \"\"'\")")
    self.assertEquals( ret, '\tdef parse(self, string, string):\n\t\tpass' )
    ret = z.matchedWithFunction('c.parse("num=123456; expires=Sun, 10-Jun-2001 12:00:00 GMT; path=/HTTP/")')
    self.assertEquals( ret, '\tdef parse(self, string):\n\t\tpass' )
    ret = z.matchedWithFunction('ret = c.parse("num=123456; expires=Sun, 10-Jun-2001 12:00:00 GMT; path=/HTTP/")')
    self.assertEquals( ret, '\tdef parse(self, string):\n\t\treturn ret' )
    ret = z.matchedWithFunction('  ret = c.parse("num=123456; expires=Sun, 10-Jun-2001 12:00:00 GMT; path=/HTTP/")')
    self.assertEquals( ret, '\tdef parse(self, string):\n\t\treturn ret' )

  def testParseArgs(self):
    ret = z.parseArgs('')
    self.assertEquals( ret, 'self' )
    ret = z.parseArgs('1')
    self.assertEquals( ret, 'self, int' )
    ret = z.parseArgs('"1"')
    self.assertEquals( ret, 'self, string' )
    ret = z.parseArgs("'1'")
    self.assertEquals( ret, 'self, string' )
    ret = z.parseArgs("'abc'")
    self.assertEquals( ret, 'self, string' )
    ret = z.parseArgs("''")
    self.assertEquals( ret, 'self, string' )
    ret = z.parseArgs("'', '', 1, 2")
    self.assertEquals( ret, 'self, string, string, int, int' )
    ret = z.parseArgs("abc, abc, 0, null")
    self.assertEquals( ret, 'self, object, object, int, object' )

