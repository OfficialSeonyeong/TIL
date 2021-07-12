# Part 4. 파이토치(PyTorch)



# 01. 왜 파이토치인가

**장점**

- NumPy와 비슷한 문법
- 동적으로 Feed-forwad와 back-propagation 경로 생성 가능
- documentation이 훌륭하다.
- 자유도가 높다.
- 코드의 파편화가 거의 없음 (버전에 따라 코드명이 달라지는 경우가 적다.)



## 02. 데이터셋이란

가상의 함수(ground-truth)를 통해 데이터 쌍(x,y)을 수집해 데이터셋을 만들고, 작성하고자 하는 함수(모델)가 데이터를 통해 가상의 함수를 모방하도록 한다.

이 때, x와 y는 각각 n차원과 m차원의 벡터로 표현될 수 있다.

Tabular Dataset : 테이블로 구성된 데이터셋



## 03. 텐서란

- 0D - scalar
- 1D - vector
- 2D - matrix
- 3D, 4D, 5D... - tensor

Tensor Shape : |x| = (k, n, m)

Matrix Shape :  |x| = (k, n)

Mini-batch → consider parallel operations

Typical Tensor Shape: NLP → (#sentences, #words, #features)

- |xi,j| = #features

Typical(black-white) Tensor Shape: Computer Vision → (#images, height, width)

Typical(color) Tensor Shape: Computer Vision → (#images, #channels, height, width)



## 04. 실습 텐서 생성하기

jupyter notebook으로 진행