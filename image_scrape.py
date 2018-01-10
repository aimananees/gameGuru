current_url='http://marketplace.xbox.com/en-IN/Games/Xbox360Games?page=8&pagesize=90'
j=631
dataset=[]
import requests
from urllib.request import urlopen
from bs4 import BeautifulSoup
"""
for i in range(1,2):
	#Accessing Games Page
	r=requests.get(current_url)
	soup=BeautifulSoup(r.text,'html.parser')
		#Extracting Info from first-column
	results_1=soup.find_all('li',attrs={'class':'grid-6 firstgridchild'})
		#Extracting Info from second-column
	results_2=soup.find_all('li',attrs={'class':'grid-6 '})
		#Extracting Info from third-column
	results_3=soup.find_all('li',attrs={'class':'grid-6 lastgridchild'})

	for result in results_1:
		image_url=result.find('img',attrs={'class':'ProductBox'})['src']
		dataset.append(image_url)
		
		filename=str(j)
		j+=1
		image_file=open(filename+".jpeg","wb")
		image_file.write(urlopen(image_url).read())
		image_file.close()
		
		

	for result in results_2:
		image_url=result.find('img',attrs={'class':'ProductBox'})['src']
		dataset.append(image_url)
		
		filename=str(j)
		j+=1
		image_file=open(filename+".jpeg","wb")
		image_file.write(urlopen(image_url).read())
		image_file.close()
		

	for result in results_3:
		image_url=result.find('img',attrs={'class':'ProductBox'})['src']
		dataset.append(image_url)
		
		filename=str(j)
		j+=1
		image_file=open(filename+".jpeg","wb")
		image_file.write(urlopen(image_url).read())
		image_file.close()	
		

	current_url='http://marketplace.xbox.com/en-IN/Games/Xbox360Games?page='+str(i+1)+'&pagesize=90'
print(len(dataset))
"""


image_file=open(str(539)+".jpeg","wb")
image_file.write(urlopen("http://download.xbox.com/content/images/66acd000-77fe-1000-9115-d8025451088b/16393/boxartsm.jpg").read())
image_file.close()

