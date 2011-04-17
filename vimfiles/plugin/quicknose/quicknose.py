import vim
import re

def QuickNoseGetCurrentClassName(pos):
  b = vim.current.buffer
  p = re.compile(r'[\s]*class[\s]+(?P<classname>[^\s.()]+)')
  pos = int(pos)
  for i in range(pos):
    line = b[pos - i - 1]
    m = p.search(line)
    if m:
      classname = m.group('classname')
      return classname
  return ''

def QuickNoseGetCurrentFunctionName(pos):
  b = vim.current.buffer
  p = re.compile(r'[\s]*def[\s]+(?P<functionname>[^\s.()]+)')
  pos = int(pos)
  for i in range(pos):
    line = b[pos - i - 1]
    m = p.search(line)
    if m:
      functionname = m.group('functionname')
      return functionname
  return ''

def QuickNoseGetCurrentTestCase(pos):
  classname = QuickNoseGetCurrentClassName(pos)
  functionname = QuickNoseGetCurrentFunctionName(pos)
  ret = classname
  if 0 < len(classname) and 0 < len(functionname): ret += '.'
  ret += functionname
  return ret

