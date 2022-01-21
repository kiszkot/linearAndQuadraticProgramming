#ifndef matrix_hpp
#define matrix_hpp

#include <string>

class Matrix {
	
public:

	int h;
	int w;
	double matrix[100][100];
	
	Matrix(int height, int width);
	
	/**
	* mat = "a11,a12,a13;a21,a22,a23;a31,a32,a33" 3x3 matrix
	* */
	Matrix(std::string mat);
};

#endif