# Part 12. 딥러닝 학습을 쉽게 하는 방법



## 01. 하이퍼 파라미터란

**Model Parameters**

- 모델 내부의 설정 값, 데이터에 의해서 값이 결정됨
- 딥러닝에서는 Weight Parameter라고 불리우기도 한다.



**Hyper Parameters**

- 모델 외부의 설정 값, 사용자에 의해서 결정됨
- 모델의 성능을 좌우할 수 있다.
- 주로 수동으로 튜닝하거나 다양한 실험을 통해 찾아야 한다.



**Network Depth & Width**

- 네트워크의 capacity를 결정하는 요소
- 너무 깊으면 과적합(overfitting)이 되어 최적화가 어렵다.
- 너무 얕으면 복잡한 데이터의 관계 또는 함수를 배울 수 없다.



**Learning Rate**

- Gradient Descent에서 기울기에 따른 파라미터의 업데이트 양 조절
- learning rate를 조절해보면 주로 다른 결과가 나온다.



**어떤 활성 함수를 어떤 각도에서 사용할 것인가?**



**어떤 초기화 방법을 쓸 것인가?**



**몇 번의 epoch를 돌릴 것인가?**



⇒ 많은 실무 경험을 통해 경험적으로 최적 값과 비슷한 값을 찾을 수 있다.



## 02. TIP: 효율적인 연구 진행 방법

*선생님의 경험적인 팁!*

**실험은 baseline 구축부터!!**

- 다른 공개된 모델을 가져다 쓴다고 해도 나의 데이터에, 내가 원하는 바로 적용하려면 기초부터 다시 구축해야 한다. 그 과정에서 실험을 해나가야 한다.
- 단순하게 작동하는 baseline을 먼저 구축해서 베이스캠프 구축, 앞으로 나가다 망쳐버리더라도 baseline으로 돌아오면 된다.
- 성능이 잘 안나올 때 다양한 가설을 세워가며 실험 설계하고 평가한다.
- 앞으로 나아가면서 여러 개의 발전된 baseline을 만들어간다.

**실험 결과물 관리**

- Hyper-parameter별 튜닝 결과를 모델 파일 이름에 저장
  - 'model.n_layers-10.n_epochs-100.act-leaky_relu.loss-xxx.accuracy-xx.pth'
- Table로 정리하는 것이 필요
- 실험 관리를 도와주는 프레임워크
  - MLFlow: https://mlflow.org/ WanDB: https://www.wandb.com (일부 유료)