import tensorflow as tf
import numpy as np
from flask_restful import reqparse, abort, Api, Resource
from flask import Flask
from models import *
import base64
import mtcnn
from PIL import Image

print('Tensorflow Version : %s' % tf.__version__)
app = Flask(__name__)
api = Api(app)

# Define the global variables here
path_gender_model = '../models_trained/model_gender.hdf5'
path_age_model = '../models_trained/model_age.hdf5'
path_race_model = '../models_trained/model_race.hdf5'

model_gender = model_arch_gender()
model_gender.load_weights(path_gender_model)

model_age = model_arch_age()
model_age.load_weights(path_age_model)

model_race = model_arch_race()
model_race.load_weights(path_race_model)

# argument parsing
parser = reqparse.RequestParser()
parser.add_argument('query')

IMG_SIZE = (256, 256)

face_detector = mtcnn.MTCNN()


class GetPredictions(Resource):
    def get(self):
        args = parser.parse_args()
        user_query = args['query']
        with open('image.jpg', 'wb') as fh:
            fh.write(base64.b64decode(user_query))

        # Resize the image and pass it through the models to get the predictions
        data = Image.open('image.jpg').convert('RGB')
        image = np.asarray(data)
        # Image is ready till here

        # Lets start detecting faces
        face_data = face_detector.detect_faces(image)
        for i in range(len(face_data)):
            x1, y1, width, height = face_data[i]['box']
            x2 = x1 + width
            y2 = y1 + height

        return user_query


api.add_resource(GetPredictions, '/')


if __name__ == '__main__':
    app.run(debug=True)
