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