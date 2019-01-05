//
// Created by joseph on 17.11.18.
//

#ifndef ROZPOZNAWANIE_TEKSTU_Z_OBRAZU_LAYER_H
#define ROZPOZNAWANIE_TEKSTU_Z_OBRAZU_LAYER_H

#include "Matrix2D.h"

namespace AGH_NN
{
  class Layer {
  public:
    //Calculate error as last
    virtual void forward_propagation(Matrix2D<double>& X) = 0;
    virtual Matrix2D<double> backward_propagation(const Matrix2D<double>& prevError) = 0;
    virtual void update_parameters(double learning_rate)
    {
      weights -= dw * learning_rate;
      bias -= db * learning_rate;
    }

    virtual void initialize_gaussian();
    virtual void initialize_gaussian(double median, double variance, unsigned long seed);


    Layer(Matrix2D<double> _weights, Matrix2D<double> _bias) :
              weights(_weights), bias(_bias){}

    virtual ~Layer() = default;
    //m = current layer weights
    //n = previous layer
    Layer(unsigned long currSize, unsigned long prevSize);
    Layer() = default;

    Matrix2D<double>& getA(){return activatedWeights;}
    Matrix2D<double>& getW(){return weights;}
    Matrix2D<double>& getB(){return bias;}
    Matrix2D<double>& getDW(){return dw;}
    Matrix2D<double>& getDB(){return db;}
    Matrix2D<double>& getLastX() {return *lastX;}

  protected:

    //matrix m x n
    Matrix2D<double> activatedWeights;

    //matrix m x n
    Matrix2D<double> weights;

    //matrix n x 1
    Matrix2D<double> bias;

    Matrix2D<double> dw;
    Matrix2D<double> db;

    //last X used
    Matrix2D<double>* lastX;
  };
}

#endif //ROZPOZNAWANIE_TEKSTU_Z_OBRAZU_LAYER_H