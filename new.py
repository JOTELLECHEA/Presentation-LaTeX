import os
import shutil
home =  os.getcwd()
temp = os.path.join(home,'template.tex')
make = os.path.join(home,'Makefile')
if os.path.exists('template.tex') == True:
	print('template.tex found\n')
	f = input('Name of new presentation: ')
	f = home + '/presentation/' + f + '/'
	print('Creating directory:',f)
	path = os.path.join(home,f)
	os.mkdir(path)
	shutil.copy(temp, path)
	shutil.copy(make, path)
	print('Done!')
else:
	print('template.tex not found!')
