#include "Matrix.hpp"

Matrix::Matrix(int height, int width) {
	h = height;
	w = width;
	double m[h][w];
	for(int i=0; i<h; i++) {
		for(int j=0; j<w; j++) {
			m[i][j] = 0;
		}
	}
	matrix = m;
}

Matrix::Matrix(std::string mat) {
	const char * mate = mat.c_str();
	h = 
	double m[h][w];
	for(int i=0; i<h; i++) {
		for(int j=0; j<w; j++) {
			m[i][j] = 0;
		}
	}
	h = height;
	w = width;
	matrix = m;
}
