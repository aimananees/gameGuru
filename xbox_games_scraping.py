current_url='http://marketplace.xbox.com/en-IN/Games/Xbox360Games?page=1&pagesize=90'
dataset=[]
import requests
from bs4 import BeautifulSoup
for i in range(1,9):
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
		game_name=result.find('h2').text
		game_url='http://marketplace.xbox.com'+result.find('a')['href']
		r=requests.get(game_url)
		soup=BeautifulSoup(r.text,'html.parser')
			
		game_info=soup.find('div',attrs={'class':'Text'}).text[1:-1]
			
		results=soup.find_all('div',attrs={'class':'capabilities'})
		for result in results:
			lis=result.find_all('li')
			features=[]
			for li in lis:
				features.append(li.text)
		"""
		lis=results[0].find_all('li')
		features=[]
		for li in lis:
			features.append(li.text)
		lis=results[1].find_all('li')
		online_features=[]
		for li in lis:
			online_features.append(li.text)
		"""
		results=soup.find('ul',attrs={'id':'ProductPublishing'})
		lis=results.find_all('li')
		info=[]
		for li in lis:
			info.append(li.text)

		#del info[2]
		images=[]
		if soup.find('div',attrs={'id':'image1'}) is not None:
			results=soup.find('div',attrs={'id':'image1'})
			images.append(results.find('img')['src'])
		if soup.find('div',attrs={'id':'image2'}) is not None:
			results=soup.find('div',attrs={'id':'image2'})
			images.append(results.find('img')['src'])
		d={
			"game_name":game_name,
			"game_info":game_info,
			"features":features,
			#"online_features":online_features,
			"info":info,
			"image_url":images
			#"image2":image2
		}
		dataset.append(d)

	for result in results_2:
		game_name=result.find('h2').text
		game_url='http://marketplace.xbox.com'+result.find('a')['href']
		r=requests.get(game_url)
		soup=BeautifulSoup(r.text,'html.parser')
			
		game_info=soup.find('div',attrs={'class':'Text'}).text[1:-1]
			
		results=soup.find_all('div',attrs={'class':'capabilities'})
		for result in results:
			lis=result.find_all('li')
			features=[]
			for li in lis:
				features.append(li.text)
		"""
		lis=results[0].find_all('li')
		features=[]
		for li in lis:
			features.append(li.text)
		lis=results[1].find_all('li')
		online_features=[]
		for li in lis:
			online_features.append(li.text)
		"""
		results=soup.find('ul',attrs={'id':'ProductPublishing'})
		lis=results.find_all('li')
		info=[]
		for li in lis:
			info.append(li.text)

		#del info[2]
		images=[]
		if soup.find('div',attrs={'id':'image1'}) is not None:
			results=soup.find('div',attrs={'id':'image1'})
			images.append(results.find('img')['src'])
		if soup.find('div',attrs={'id':'image2'}) is not None:
			results=soup.find('div',attrs={'id':'image2'})
			images.append(results.find('img')['src'])
		d={
			"game_name":game_name,
			"game_info":game_info,
			"features":features,
			#"online_features":online_features,
			"info":info,
			"image_url":images
			#"image2":image2
		}
		dataset.append(d)

	for result in results_3:
		game_name=result.find('h2').text
		game_url='http://marketplace.xbox.com'+result.find('a')['href']
		r=requests.get(game_url)
		soup=BeautifulSoup(r.text,'html.parser')
			
		game_info=soup.find('div',attrs={'class':'Text'}).text[1:-1]
			
		results=soup.find_all('div',attrs={'class':'capabilities'})
		for result in results:
			lis=result.find_all('li')
			features=[]
			for li in lis:
				features.append(li.text)
		"""
		lis=results[0].find_all('li')
		features=[]
		for li in lis:
			features.append(li.text)
		lis=results[1].find_all('li')
		online_features=[]
		for li in lis:
			online_features.append(li.text)
		"""
		results=soup.find('ul',attrs={'id':'ProductPublishing'})
		lis=results.find_all('li')
		info=[]
		for li in lis:
			info.append(li.text)

		#del info[2]
		images=[]
		if soup.find('div',attrs={'id':'image1'}) is not None:
			results=soup.find('div',attrs={'id':'image1'})
			images.append(results.find('img')['src'])
		if soup.find('div',attrs={'id':'image2'}) is not None:
			results=soup.find('div',attrs={'id':'image2'})
			images.append(results.find('img')['src'])
		d={
			"game_name":game_name,
			"game_info":game_info,
			"features":features,
			#"online_features":online_features,
			"info":info,
			"image_url":images
			#"image2":image2
		}
		dataset.append(d)


	current_url='http://marketplace.xbox.com/en-IN/Games/Xbox360Games?page='+str(i+1)+'&pagesize=90' 
	print(len(dataset))




