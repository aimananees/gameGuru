python /Users/aimanabdullahanees/Desktop/gameGuru/Backend/retrain.py --bottleneck_dir=/Users/aimanabdullahanees/Desktop/gameGuru/Backend/bottlenecks --how_many_training_steps 500 --model_dir=/Users/aimanabdullahanees/Desktop/gameGuru/Backend/inception --output_graph=/Users/aimanabdullahanees/Desktop/gameGuru/Backend/retrained_graph.pb --output_labels=/Users/aimanabdullahanees/Desktop/gameGuru/Backend/retrained_labels.txt --image_dir /Users/aimanabdullahanees/Desktop/gameGuru/Backend/training_data



curl -i -H "Content-Type: application/json" -X POST -d '{"url":"https://firebasestorage.googleapis.com/v0/b/gameguru-b3dba.appspot.com/o/1520167681066.49?alt=media&token=78b02e74-42ec-47d1-8cfd-4ea8130632cb"}' http://localhost:5000/sendURL/getGame
