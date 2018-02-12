import tensorflow as tf, sys
from flask import Flask, render_template, request, jsonify, send_from_directory
from flask.ext.uploads import UploadSet, configure_uploads, IMAGES
import time
import os

app = Flask(__name__)

photos = UploadSet('photos', IMAGES)

app.config['UPLOADED_PHOTOS_DEST'] = 'static/img'
configure_uploads(app, photos)

@app.route('/upload', methods=['GET', 'POST'])
def upload():
	if request.method == 'POST':
			file = request.files['file']
			if file:
				filename = str(time.time()).replace(".", "") + ".jpg"
				file.save(os.path.join(app.config['UPLOADED_PHOTOS_DEST'], filename))
				return jsonify({'upload':True, 'name' : filename})

@app.route('/get/picture/<string:name>', methods=['GET'])
def send_pics(name):
	pics = open("static/img/" + name)
	##TensorFlow-Part
	
	if pics:
		image_path="/Users/aimanabdullahanees/Desktop/gameGuru/static/img/"+name
		image_data = tf.gfile.FastGFile(image_path, 'rb').read()
		# Loads label file, strips off carriage return
		label_lines = [line.rstrip() for line
			in tf.gfile.GFile("/Users/aimanabdullahanees/Desktop/gameGuru/retrained_labels.txt")]
		# Unpersists graph from file
		with tf.gfile.FastGFile("/Users/aimanabdullahanees/Desktop/gameGuru/retrained_graph.pb", 'rb') as f:
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
				score = predictions[0][node_id]
				d[human_string]=str(score)
				#print('%s (score = %.5f)' % (human_string, score))

		return jsonify(d)




if __name__ == '__main__':
	app.run(debug=True)