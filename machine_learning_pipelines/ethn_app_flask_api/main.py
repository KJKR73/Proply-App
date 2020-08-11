import tensorflow as tf
import numpy as np
from flask_restful import reqparse, abort, Api, Resource
from flask import Flask, json
from models import *
import base64
import mtcnn
from PIL import Image
from io import BytesIO
from pydub import AudioSegment 
import gc

app = Flask(__name__)
api = Api(app)

# Define the global variables here
path_gender_model = 'models_trained/model_gender.hdf5'
path_age_model = 'models_trained/model_age.hdf5'
path_race_model = 'models_trained/model_race.hdf5'

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
    def post(self):
        list_preds = {}
        args = parser.parse_args()
        user_query = args['query']
        print(len(user_query))
        with open('image.jpg', 'wb') as fh:
            fh.write(base64.b64decode(user_query))
        fh.close()
        with open('quert.txt', 'w') as fh2:
            fh2.write(user_query)
        fh2.close()

        # Resize the image and pass it through the models to get the predictions
        data = Image.open('image.jpg').convert('RGB')
        image = np.asarray(data)
        # Image is ready till here
        try:
            # Lets start detecting faces
            face_data = face_detector.detect_faces(image)
            if len(face_data) == 0:
                return 'Face/Faces were not detected, Please see that the image contains a face or check the lightening'

            # Lets get the faces crop them, pass them through the models one by one and send the predictions
            for i in range(len(face_data)):
                x1, y1, width, height = face_data[i]['box']
                x2 = x1 + width
                y2 = y1 + height
                face = image[y1:y2, x1:x2]
                face = Image.fromarray(face)
                face = face.resize(IMG_SIZE)
                face_input = np.asarray(face).reshape((1, IMG_SIZE[0], IMG_SIZE[0], 3)) / 255.0

                # Pass the face through the model for testing
                gender_label = model_gender.predict(face_input)
                race_label = np.argmax(model_race.predict(face_input))
                age_label = model_age.predict(face_input)

                # Convert Image to base64
                im_file = BytesIO()
                face.save(im_file, format="PNG")
                im_bytes = im_file.getvalue()  # im_bytes: image in binary format.
                im_b64 = base64.b64encode(im_bytes)

                list_preds['face%i' % i] = {
                    'base64': im_b64.decode('utf-8'),
                    'age': int(age_label[0][0]),
                    'gender': int(np.round(gender_label[0][0])),
                    'race': int(race_label) + 1
                }

            return list_preds

        except():
            return 'Backend Error Occured'


class HumanCheck(Resource):
    def post(self):
        args = parser.parse_args()
        user_query = args['query']
        print(len(user_query))
        with open('image.jpg', 'wb') as fh:
            fh.write(base64.b64decode(user_query))
        fh.close()

        # Resize the image and pass it through the models to get the predictions
        data = Image.open('image.jpg').convert('RGB')
        image = np.asarray(data)
        # Image is ready till here
        try:
            # Lets start detecting faces
            face_data = face_detector.detect_faces(image)
            if len(face_data) == 0:
                return {
                    'response': 0
                }
            else:
                return {
                    'response': 1
                }

        except():
            return 'Backend Error Occured'


class Home(Resource):
    def get(self):
        return 'Ethn-app-flask'


api.add_resource(Home, '/')
api.add_resource(GetPredictions, '/predictions')
api.add_resource(HumanCheck, '/humancheck')

if __name__ == '__main__':
    app.run(debug=True)
