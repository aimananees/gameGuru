import tensorflow as tf, sys
from flask import Flask, render_template, request, jsonify, send_from_directory
from flask.ext.uploads import UploadSet, configure_uploads, IMAGES
import time
import os
from firebase import firebase
import urllib.request
import calendar

app = Flask(__name__)
photos = UploadSet('photos', IMAGES)


app.config['UPLOADED_PHOTOS_DEST'] = 'static/img'
configure_uploads(app, photos)

URL_from_iOS_App=""

@app.route('/sendURL/getGame',methods = ["GET","POST"])
def send_URL_get_Game():
	file_path="result.txt"
	if request.method == "POST":
		task = {
			'url':request.json['url']
		}
		URL_from_iOS_App=task['url']
		ts = str(calendar.timegm(time.gmtime()))+".jpg"
		urllib.request.urlretrieve(URL_from_iOS_App, "static/img/"+ts)
		f = open(file_path, 'w')
		f.write(ts)
		f.close()
		return jsonify(task)

	else:
		f=open(file_path,'r')
		ts=f.read()
		f.close()
		pics = open("static/img/" + ts)
		if pics:
			image_path="/Users/aimanabdullahanees/Desktop/gameGuru/Backend/static/img/"+ts
			image_data = tf.gfile.FastGFile(image_path, 'rb').read()
			# Loads label file, strips off carriage return
			label_lines = [line.rstrip() for line
				in tf.gfile.GFile("/Users/aimanabdullahanees/Desktop/gameGuru/Backend/retrained_labels.txt")]
			# Unpersists graph from file
			with tf.gfile.FastGFile("/Users/aimanabdullahanees/Desktop/gameGuru/Backend/retrained_graph.pb", 'rb') as f:
				graph_def = tf.GraphDef()
				graph_def.ParseFromString(f.read())
				_ = tf.import_graph_def(graph_def, name='')
			# Feed the image_data as input to the graph and get first prediction
			with tf.Session() as sess:
				softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')
				predictions = sess.run(softmax_tensor, 
				{'DecodeJpeg/contents:0': image_data})
		 		# Sort to show labels of first prediction in order of confidence
				top_k = predictions[0].argsort()[-len(predictions[0]):][::-1]
				d={}
				for node_id in top_k:
					human_string = label_lines[node_id]
					score = str(predictions[0][node_id])
					d[score]=human_string
					#print('%s (score = %.5f)' % (human_string, score))
				max_score=max(d.keys())
				#response=[{"game_name":d[max_score]}]
				game_id=d[max_score]
				print(game_id)

				firebase1=firebase.FirebaseApplication('https://gameguru-b3dba.firebaseio.com/')
				result=firebase1.get('/games',None)
				games_key_list=[]
				for i in result.keys():
					games_key_list.append(i)

				response=dict()
				for i in games_key_list:
					if game_id == result[i]['game_id']:
						response['developer']=result[i]['developer']
						response['game_description']=result[i]['game_description']
						response['game_genre']=result[i]['game_genre']
						response['game_image']=result[i]['game_image']
						response['game_name']=result[i]['game_name']
						response['game_support_image_1']=result[i]['game_support_image_1']
						response['game_support_image_2']=result[i]['game_support_image_2']
						response['game_support_image_3']=result[i]['game_support_image_3']
						response['game_url']=result[i]['game_url']
						response['publisher']=result[i]['publisher']
						break

				return jsonify(response)


if __name__ == '__main__':
	app.run(debug=True,port=8000)


