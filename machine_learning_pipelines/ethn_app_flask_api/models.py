import tensorflow as tf
import numpy as np
import pandas as pd

IMG_SIZE = 256


# For Loading the gender model
def model_arch_gender():
    inp = tf.keras.layers.Input(shape=(IMG_SIZE, IMG_SIZE, 3), name='inp')
    x = tf.keras.layers.Conv2D(32, (3, 3), strides=(1, 1), padding='same')(inp)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)

    x = tf.keras.layers.Conv2D(64, (3, 3), strides=(1, 1), padding='same')(x)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)

    x = tf.keras.layers.Conv2D(128, (3, 3), strides=(1, 1), padding='same')(x)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)

    x = tf.keras.layers.Conv2D(256, (3, 3), strides=(1, 1), padding='same')(x)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)
    x = tf.keras.layers.Flatten()(x)

    out = tf.keras.layers.Dense(1, activation='sigmoid')(x)

    model = tf.keras.models.Model(inp, [out])
    model.compile(loss=tf.keras.losses.BinaryCrossentropy(), optimizer='Adam', metrics=['accuracy'])
    return model


# For Loading the race model
def model_arch_race():
    inp = tf.keras.layers.Input(shape=(IMG_SIZE, IMG_SIZE, 3), name='inp')
    x = tf.keras.layers.Conv2D(32, (3, 3), strides=(1, 1), padding='same')(inp)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)

    x = tf.keras.layers.Conv2D(64, (3, 3), strides=(1, 1), padding='same')(x)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)

    x = tf.keras.layers.Conv2D(128, (3, 3), strides=(1, 1), padding='same')(x)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)

    x = tf.keras.layers.Conv2D(256, (3, 3), strides=(1, 1), padding='same')(x)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)
    x = tf.keras.layers.Flatten()(x)

    out = tf.keras.layers.Dense(5, activation='softmax')(x)

    model = tf.keras.models.Model(inp, [out])
    model.compile(loss=tf.keras.losses.CategoricalCrossentropy(), optimizer='Adam', metrics=['accuracy'])
    return model


# For Loading the age model
def model_arch_age():
    inp = tf.keras.layers.Input(shape=(IMG_SIZE, IMG_SIZE, 3), name='inp')
    x = tf.keras.layers.Conv2D(32, (3, 3), strides=(1, 1), padding='same')(inp)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)

    x = tf.keras.layers.Conv2D(64, (3, 3), strides=(1, 1), padding='same')(x)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)

    x = tf.keras.layers.Conv2D(128, (3, 3), strides=(1, 1), padding='same')(x)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)

    x = tf.keras.layers.Conv2D(256, (3, 3), strides=(1, 1), padding='same')(x)
    x = tf.keras.layers.BatchNormalization(axis=-1)(x)
    x = tf.keras.layers.Activation('relu')(x)
    x = tf.keras.layers.MaxPooling2D((2, 2))(x)
    x = tf.keras.layers.Flatten()(x)

    x = tf.keras.layers.Dense(16, activation='relu')(x)
    out = tf.keras.layers.Dense(1, activation='linear')(x)

    model = tf.keras.models.Model(inp, [out])
    model.compile(loss=tf.keras.losses.MeanAbsoluteError(), optimizer='Adam', metrics=[tf.keras.metrics.MAE])
    return model

