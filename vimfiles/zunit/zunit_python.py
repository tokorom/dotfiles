import re

def ZUnitParse(line):
  ret = matchedWithFunction(line)
  if 0 < len(ret):
    return ret.expandtabs(2)
  if 1 > len(ret):
    return 'could not complete.'

def matchedWithFunction(line):
  ret = ''
  p = re.compile(r'[\t\r\n]')
  line = p.sub(' ', line)
  p = re.compile(r'[\s.]*(?P<funcname>[^\s.()]+)\((?P<args>.*)\)[^)]*')
  m = p.search(line)
  if m:
    funcname = m.group('funcname')
    argString = m.group('args')
    argString = parseArgs(argString)
    returnString = None
    p = re.compile(r'^[\s]*(?P<return>[^\s=()]+)[\s]*=[\s]*[^\s=]+')
    m = p.search(line)
    if m:
      returnString = m.group('return')
    ret = '\tdef ' + funcname + '(' + argString + '):' + '\n\t\t'
    if returnString and 0 < len(returnString):
      ret += 'return ret'
    else:
      ret += 'pass'
  return ret

def parseArgs(argString):
  ret = 'self'
  argString = argString.strip()
  sidx = argString.find("'")
  didx = argString.find('"')
  while -1 < sidx or -1 < didx:
    if 0 > sidx and 0 > didx:
      break
    if -1 == didx or ( -1 < sidx and sidx < didx):
      p = re.compile(r"\'[^']*\'")
    else:
      p = re.compile(r'\"[^"]*\"')
    argString = p.sub('<string>', argString)
    sidx = argString.find("'")
    didx = argString.find('"')
  p = re.compile(r'[\s,]+')
  args = p.split(argString)
  for arg in args:
    if 1 > len(arg):
      continue
    elif arg.isdigit():
      ret += ', int'
    elif arg == '<string>':
      ret += ', string'
    else:
      ret += ', object'
  return ret

