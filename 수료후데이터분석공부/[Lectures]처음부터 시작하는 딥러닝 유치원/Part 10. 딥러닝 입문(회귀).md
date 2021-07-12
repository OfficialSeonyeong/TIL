# Part 10. 딥러닝 입문(회귀)



## 01. Deep Neural Networks

세상에 많은 문제들이 높고 복잡한 차원의 데이터를 다룬다. → `비선형 모델 구축 필요`

> 만약 Linear layer를 깊게 쌓으면 안될까?

$$
h = x \times W_1 + b_1 \space \\ y = h \times W_2 + b_2 \\ = (x \times + b_1) + W_2 + b_2 \\ = x \times W_1 \times W_2 +b_1 \times W_2 + b_2
$$

또한, 선형 함수의 형태를 갖춘 결과를 반환한다.

> Logistic Regression에서 배운 Sigmoid 함수는 비선형 함수였다. 그래서 이 점을 활용하면 된다!

레이어 사이에 비선형 활성 함수(Non-linear activation function)를 넣는다.

깊이(depth)와 너비(width)를 넓게 할수록 신경망의 표현력이 좋아진다, 복잡한 형태의 함수를 배울 수 있는 능력이 생긴다.

⇒ **주로 차원이 깊어질수록 너비가 줄어드는 형태를 가진다.**



## 02. Back-propagation

- 레이어 개수만큼 파라미터 개수가 증가한다. 이 외 과정은 회귀 함수와 동일
- Loss 값을 학습 파라미터로 미분해야 하는데 개수가 너무 많고 계산이 복잡해진다.
- `Chain Rule` 미분을 다른 변수들의 미분의 곱으로 표현할 수 있다. → 심층 신경망은 합성함수로 표현될 수 있다. ⇒ 필요한 기존 미분 값을 재활용

⇒ Back-propagation을 통해 반복되는 **미분 과정을 효율적으로 만들 수 있다.**

- `Backward()` 함수 호출



## 03. 수식 Back-propagation

치환, 전개, 대입 등을 하면서 미분을 해야 함. ⇒ Back propagation with **Chain Rule**
$$
\frac {\alpha L} {\alpha W_3} = \frac {\alpha L}{\alpha \hat y} \times \frac {\alpha \hat y}{\alpha W_3} \\ \frac {\alpha L} {\alpha W_2} = \frac {\alpha L} {\alpha \hat y} \times \frac {\alpha \hat y} {\alpha h_2} \times \frac {\alpha h_2} {\alpha W_2} \\ \frac {\alpha L} {\alpha W_1} = \frac {\alpha L} {\alpha \hat y} \times \frac {\alpha \hat y} {\alpha h_2} \times \frac {\alpha h_2} {\alpha h_1} \times \frac {\alpha h_1} {\alpha W_1}
$$


## 04. Gradient Vanishing

- Back propagation에서 입력에 가까운 레이어의 파라미터일수록 곱셈이 늘어난다.
  - Gradient가 1보다 작을 경우, 매우 작아진다.
  - 업데이트가 되지 않고 사라져버리는 경우 → Gradient Vanishing
  - Gradient of Sigmoid & TanH의 경우(*activation functions*), 모두 1보다 작거나 같다. 그래서 입력에 가까워질수록 0에 가까워지고, 업데이트가 거의 되지 않는다. 결과적으로 인공 신경망의 성능이 떨어진다.
  - *Gradient Exploding: Gradient가 너무 커서 최소 값을 찾지 못하고 발산하는 경우*



## 05. ReLU

- ReLU(Rectified Linear Unit): Gradient  Vanishing를 해결해줄 함수

- 두 개의 linear 함수로 이루어져 있다.
  $$
  y = ReLU(x) = \max(0, x)
  $$

- Sigmoid, TanH 함수는 기울기가 완만해지는 구간에서 학습이 늦어진다. 하지만 ReLU는 기울기가 전부 1으로 수렴이 빠르다.

- 하지만, 기울기가 0인 부분(음수)으로 인해 기울기가 소멸할 수 있다. (희박하지만 가능)

- 그래서 기울기를 조절할 수 있는 **Leaky ReLU**가 있다.

**Leaky ReLU**
$$
y = LeakyReLU(x) = \max(\alpha \times x, x), where \space 0\leq \alpha < 1.
$$

- 기울기 값에 따름.
- gradient vanishing 문제를 어느정도 해결할 수 있다.

- 하지만 무조건 Leaky ReLU가 좋은 것은 아니다.



## 06. 실습 Deep Regression

jupyter notebook으로 실행



## 07. Wrap-up

- 비선형 데이터의 관계 또는 함수에 대해 근사 가능한 Deep Neural Networks
- 하지만, 파라미터가 늘어남에 따른 최적화가 어렵다.
- 여전히 같은 방법(gradient descent)을 통해 최적화한다. 하지만 DNN은 non-convex한 loss surface를 가진다.
