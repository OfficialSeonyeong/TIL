# Part 9. 로지스틱 회귀(Logistic Regression)



## 01. Activation Functions: Sigmoid & TahH

- Sigmoid는 **0 ~ 1** 의 값을 가진다.  
  $$
  \sigma(x)
  $$
  

- TahH는 **-1 ~ 1** 의 값을 가진다.   

$$
Tanh(x)
$$





## 02. 실습 Sigmoid Function

jupyter notebook으로 실행



## 03. Logistic Regression

- **참(True)/거짓(False)**으로 결과가 나뉘는 함수들도 존재한다.
- Linear Regression과 비슷한 구조이나, 마지막에 Sigmoid 함수를 통과 시킴
- 1(True)과 0(False) 사이의 값 반환 - 0.5 이상이면 True, 0.5 이하이면 False
- sigmoid의 출력 값은 확률 값 $P(y|x)$으로 생각해볼 수 있다.
- **이진 분류(binary classification)** 문제이다.



## 04. Binary Cross Entropy Loss

- Sigmoid의 출력 값은 0에서 1, 확률 값 ```P(y|x)```

- 실제 정답이 1이라면, 예측값도 최대한 커지도록 학습 → Binary Cross Entropy Loss Function

- $$
  BCE(y_{1:N}, \hat y_{1:n}) = -1/N \space  \sum_{i=1}^Ny_i^T \space × \space log\hat y_i \space  + \space (1-y_i)^T \space × \space log(1-\hat y_i)
  $$

- 값에 따라 수식의 왼쪽 term과 오른쪽 term이 on/off

→ 실제 정답이 1이면 maximization, 실제 정답이 0이면 minimization 되도록 작동

*Regression의 경우는 보통 손실함수 MSELoss 활용*



## 05. 수식 Logistic Regression

$$
D = {(x_i,y_i)}*{i=1}^N,  \space where\space  x*{1:N} \in R^{N×n} \space and \space  y_{1:N} \in [0,1]^{N×n}.
$$

$$
\hat y_{1:N} = \sigma (x_{1:N} \space × \space W + b)$  ← $\hat P(y = True|x_i) \approx \hat y_i
$$

$$
L(W,b) = -1/N \sum_{i=1}^N y_i^T \space × \space log \hat y_i + (1-y_i)^T \space × \space log(1- \hat y_i)
$$

$$
\hat \theta = argminL(\theta), \space where \space \theta = {W,b}
$$

$$
BCELoss(y_{1:N}, \hat y_{1:n}) = -1/N \space  \sum_{i=1}^N \sum_{j=1}^my_{i,j} \space × \space log\hat y_{i,j} \space  + \space (1-y_{i,j}) \space × \space log(1-\hat y_{i,j})
$$

$$
= -1/N \space  \sum_{i=1}^N \sum_{j=1}^m P(y_j = True|x_i) ×logP(y_j=True|x_i;\theta)+P(y_j=False|x_i) × logP(y_j=False|x_i;\theta), \space where \space y_{i,j}=P(y_j=True|x_i) \space and \space 1-y_{i,j} = P(y_j=False|x_i).
$$



## 06. 실습 Logistic Regression

jupyter notebook으로 실행



## 07. Wrap-up

Linear layer를 활용하여 구하고자 하는 함수를 근사하고자 함.

- Linear Regression: 선형 관계를 근사할 수 있음 (MSE Loss Function 사용)
- Logistic Regression: 선형 데이터에서 이진 분류를 수행할 수 있음 (BCE Loss Function 사용)

하지만, 세상에는 선형 관계로는 해석할 수 없는 비선형 데이터들이 넘쳐난다. (이미지, 텍스트, 음성 등) → 비선형 모델이 필요함
