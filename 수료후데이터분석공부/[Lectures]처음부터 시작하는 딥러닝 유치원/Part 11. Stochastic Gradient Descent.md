# Part 11. Stochastic Gradient Descent



## 01. Stochastic Gradient Descent(SGD)

- 기존 방법: Gradient Descent를 사용해서 전체 샘플의 loss를 구하고 난뒤 첫 번째 파라미터를 업데이트했다. → 이는 용량을 많이 소비하고, 시간이 오래 소요
- SGD: random $k$ sample loss를 구해 첫 번째 파라미터 업데이트, 그 후 앞에 사용한 sample 제외하고 다시 random $k$  sample loss를 구해 2번째 파라미터 업데이트
- random bias로 gradient 방향이 바뀌었을 수도 있음
- 1 Epoch: 모든 데이터셋의 샘플들이 forward & backward 되는 시점, 데이터 셋을 random shuffling  해준 후, 미니배치로 나눈다.
- 1 Iteration: 한 개의 미니배치 샘플들이 forward & backward 되는 시점
- 따라서, Epoch와 Iteration의 이중의 for loop가 만들어진다. (전체 업데이트 횟수: #epochs $\times$ #iterations)

⇒ 1 epoch당 파라미터 update 횟수 증가(1 epoch당 소요 시간 증가)

⇒  batch size가 작아질수록 실제 gradient와 달라진다. 하지만 어쩌면 그로 인해 local minima를 탈출할 수도 있다.

⇒ 요즘 추세는 **큰 batch size** (GPU 사용해 병렬 연산 가능)



## 02. 그림을 통한 SGD 이해

- 각 미니배치의 gradient는 전체 데이터의 gradient와 다를 것이다. (noisy)
- batch size가 작을수록 Variance는 더욱 커진다.
- batch size가 작으면 local minima 탈출 가능성이 있다.
- batch size가 크면 상대적으로 빠르게 수렴한다.



## 03. 미니배치 크기에 따른 특징

1. batch size가 data size와 비슷할 경우
   - 크기가 매우 크다면 실제 모집단의 분포와 비슷한 데이터셋의 분포를 보이게 된다.
   - gradient의 방향은 실제 전체 데이터셋을 활용한 gradient의 방향과 비슷할 것이다.
   - 하지만 한번의 파라미터 업데이트를 위해 더 많은 계산이 필요하다.
2. batch size가 작을 경우
   - 랜덤 샘플은 편향되어 있을 것이다. gradient의 방향 또한 모집단의 방향과 꽤 다를 것이다.
   - local minima를 탈출할 수도 있다.
   - 하지만 gradient가 nosy해져 수렴이 어려워질 수 있다.

배치 사이즈가 클수록 파라미터 업데이트 횟수는 줄어든다. 대신 한번 학습할 때, gradient의 방향은 상대적으로 정확할 수 있다.

⇒ 배치 사이즈에 따라 모델의 학습 속도에 영향을 끼친다.

*추천 배치 사이즈: **256**, 128, 64*



## 04. 실습 SGD 적용하기

jupyter notebook으로 실행
