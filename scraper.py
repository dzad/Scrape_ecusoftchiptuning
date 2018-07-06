import requests
from bs4 import BeautifulSoup
import pandas as pd
import re


def main():
	## webpage URL
	URL = 'https://www.ecusoft-chiptuning.de/pkwliste'

	## init Dataframe
	df = pd.DataFrame(columns=['carmodel', 'marke', 'buildyear', 'typeengine', 'enginedescription'])

	## getting the desired webpage
	res = requests.get(URL)
	soup = BeautifulSoup(res.text, 'html5lib')

	## find all divs with panel-body class
	panels = soup.find_all('div', {'class':'panel-body'})

	## iterate throw all the existing panels in the webpage
	for panel in panels:
		## getting the panel page
		subUrl = panel.a['href']
		subRes = requests.get(subUrl)
		subSoup = BeautifulSoup(subRes.text, 'html5lib')
		
		## find all the models in this panel
		models = subSoup.find_all('a', {'class':'list-group-item'})
		
		## start a session to make a post request otherwise it wan't be performed
		session = requests.Session()
		session.head(subUrl)

		## iterate throw the models
		for model in models:
			## getting the marke from the subURL
			marke = re.findall('.*/(.*)$', subUrl)[0]
			## getting the markenname from the h1 tag
			markenname = subSoup.find('h1', {'class':'panel-title'}).getText()

			## making post request using the session intiated earlier
			r = postReq(session, {"action": "get_buildyear", 
								  "marke": "marke", 
								  "model": model.getText(), 
								  "markenname": markenname})
			BYSoup = BeautifulSoup(r.text, 'html5lib')

			## finding build years then iterating throw them
			buildyears = BYSoup.find_all('a',{'class':'list-group-item'})
			for buildyear in buildyears:
				## making post request using the session intiated earlier
				r = postReq(session, {"action":"get_engine",
									  "marke":marke,
									  "model":model.getText(), 
									  "buildyear":buildyear.getText(),
									  "markenname":markenname})

				engineSoup = BeautifulSoup(r.text, 'html5lib')
				## finding existing engine for that car model and for this build year
				types = engineSoup.select('div.panel-heading h3')
				## getting engine descriptions
				bodies = engineSoup.select('div.panel-body')
				for i,body in enumerate(bodies):
					for item in body.select('a.list-group-item'):
						df = df.append(pd.Series({'carmodel':markenname, 
												  'marke':model.getText(), 
												  'buildyear':buildyear.getText(), 
												  'typeengine':types[i].getText(), 
												  'enginedescription':item.getText()}), 
									   ignore_index=True)
					

	## exporting the result to csv format
	df.to_csv('test.csv')

def postReq(session, data):
	return session.post(url='https://www.ecusoft-chiptuning.de/includes/helper.php',
	data={"action":data.action,
		  "marke":data.marke,
		  "model":data.model,
		  "markenname":data.markenname,
		  "buildyear":data.buildyear
		  })	


if __name__ == '__main__': main()
