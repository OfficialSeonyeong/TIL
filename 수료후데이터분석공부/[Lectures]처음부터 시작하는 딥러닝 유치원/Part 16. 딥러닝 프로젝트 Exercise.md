# Part 16. 딥러닝 프로젝트 Exercise



## 01. 실무에서 신경써야 할 것들

- Jupyter Notebook은 프로그램 개발에 적합하지 않고, 배포하기에 적합하지 않다.
- 실무에서는 Linux Console 위주로 진행됨
- 필요 모듈 예시
  - [model.py](http://model.py): Architecture가 정의된 클래스
  - [trainer.py](http://trainer.py): Model을 학습하기 위한 코드
  - [dataloader.py](http://dataloader.py): 데이터를 불러와 전처리를 수행하고, 신경망에 넣기 좋은 형태로 변환
  - [train.py](http://train.py): 사용자로부터 hyper-param을 받아, Model과 Trainer, Loader를 선언하고 학습
  - [predict.py](http://predict.py): 사용자로부터 Model과 input을 받아, 추론을 수행

<img src="./Image/typical deep learning training.png" style="zoom:60%;" />



## 02. 시작하기 전에 해야 할 것들

- 레이블(label) 해결법 - **직접 labeling** or 외주
- 데이터를 나눌 때 Test set은 따로 제작하기도 함
- 네트워크 설계: 레이어의 크기, 깊이 등의 사소한 차이는 큰 성능의 변화를 이끌어내지 않는다. 일단 가장 기본적인 형태로 만들어 baseline 구성하는 것이 중요
- 초기 모델 구조 선정 후 Valid Set으로 Hyper parameter Tuning



## 03. 실습 브리핑

- MNIST 데이터 활용하여 batch_norm 또는 dropout을 사용해 regulations
- linear layer, LeakyReLU, LogSoftmax 사용( NLL Loss)
- 실험을 반복해서 (동시에) 수행할 수 있어야 함
- 모델 아키텍처가 바뀌어도 바로 동작할 수 있어야 함
- hyper-param를 바꿔서 다양한 실험을 돌릴 수 있어야 함
- 코드의 일부분이 수정되어도, 다른 부분은 큰 수정이 없도록 독립적으로 동작해야 함



## 04. 실습 Classifier 구현하기

visual studio code에서 진행



## 05. 실습 Trainer 구현하기

visual studio code에서 진행



## 06. 실습 [train.py](http://train.py) 구현하기

visual studio code에서 진행



## 07. 실습 CLI 환경에서 실행하기

앞 실습에서 만든 파일 prompt에서 진행

```
python train.py --model_fn ./model.pth --train_ratio 0.8 --batch_size 512 --n_layers 3 --verbose 1
```



## 08. 실습 predict.ipynb 구현하기

jupyter notebook으로 진행



## 09. Wrap-up

부족한 점

- 데이터 전처리/분할 등을 직접 구현
- 여전히 custom for-loop에 의존
- 많은 사람들(팀원들)이 동의할 수 있는 interface를 갖추지 못함

개선할 점

- PyTorch Dataset을 활용하자
- 통용될 수 있는 interface를 갖추자
- 따라서 PyTorch Ignite 또는 Lightning과 같은 라이브러리를 활용하자