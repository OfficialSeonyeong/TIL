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



## 03. Momentum, Adative LR & Adam Optimizer

**Learning Rate Scheduling**

학습 초반에는 큰 LR, 후반에는 작은 LR으로 최적화

- 현재 epoch에서 loss가 과거 epoch의 loss보다 더 나아지지 않은 경우, 일정 비율(보통 0.5)로 줄이기
- 정해진 epoch가 지날 때마다 일정 비율로 줄이기

**SGD with Momentum**

관성을 활용하여 더 빨리 수렴하거나 local minima를 탈출할 수 있는 방법

**Difficulty in Learning Rate Tuning**

- 데이터나 신경망의 구조가 바뀔 때마다 튜닝 필요 - 튜닝 이후에도 최적의 learning rate인지 확신할 수 없음
- 왜냐면 궁극적으로 loss surface의 형태를 알 수 없기 때문

**Adaptive Learning Rate**

파라미터별로 learning rate가 다르게

⇒ update가 많았던 파라미터는 점차 작은 learning rate를 갖도록 한다.

⇒ **Adam Optimizer :** 기존 Adaptive LR 방식에 momentum이 더해진 형태

**추세는 Adam과 SGD 선호**



## 04. 수식 Adaptive LR Optimizer

**Momentum**

Accumulate gradient from the beginning with discount factor.
$$
\tilde g_t = \gamma \times \tilde g_{t-1} - \eta \times g_t \\ = -\eta \times \sum _{i=1} ^t \gamma^{t-i} \times g_i, \\ where \space \tilde g_0 = 0 \space and \space  \gamma \space is momentum.
$$

$$
\theta _{t+1} = \theta_t + \tilde g_t \\ = \theta_t -\eta \times \sum _{i=1} ^t \gamma^{t-i} \times g_i
$$

위 아래로 움직이는 기울기 값은 상쇄되고, 방향성을 띈 기울기 값은 계속 누적(관성)되어 최적의 loss 값에 빠르게 도달

**Adaptive LR: AdaGrad**

Each parameter has its own learning rate, which is divided by sum of squares.
$$
\gamma_t = \gamma_{t-1} + g_t ⊙ g_t \\ \sum_{i=1}^t g_i ⊙ g_i \\ where \space r_0=0 \space and \space ⊙ \space is element-wise multiplication. \\ \theta_{t+1} = \theta_t - \eta / \sqrt{r_t + \epsilon} ⊙ g_t \\ = \theta_T - \eta \times g_t / \sqrt{\epsilon + \sum_{i=1}^t g_i ⊙ g_i}
$$


**Adaptive LR + Momentum: Adam**

![](./Image/Adam 수식.png)

![](./Image/Adam Explanation.png)

adam이 가장 hyper-parameter의 변화에 강인하다.



## 05. 실습 Adam Optimizer 적용하기

jupyter notebook으로 진행



## 06. Wrap-up

일부 critical한 파라미터를 인지하고 주로 튜닝해야 한다.

**Adaptive LR**

- Weight param 별로 LR을 따로 갖게 됨
  - 파라미터 업데이트가 될수록 LR이 각자 작아짐
- SGD에 비해 수렴이 빠르고 편리함
  - 때론 복잡한 구조의 모델에서는 잘 동작하지 않기도 함
- Weight처럼 Optimizer가 저장되어야 함
  - 학습이 중간에 재개될 경우, 이전 iteration까지 값이 필요
  - 모델 저장할 때 Optimizer도 저장해야 함
- Adam이 가장 널리 사용됨