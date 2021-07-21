import torch
import torch.nn as nn

class SequenceClassifier(nn.Module):

    def __init__(self, input_size, hidden_size, output_size, n_layers=4, dropout_p=.2,):
        # input_size = 28, output_size = 28, n_layers는 4개까지 권장

        self.input_size = input_size
        self.hidden_size = hidden_size
        self.output_size = output_size
        self.n_layers = n_layers
        self.dropout_p = dropout_p

        super().__init__()

        self.rnn = nn.LSTM(
            input_size = input_size,
            hidden_size = hidden_size,
            num_layers = n_layers,
            batch_first = True, # lstm의 기본 데이터 형태는 (time-step, batch size, size)
            dropout = dropout_p,
            bidirectional = True,
        )
        self.layers = nn.Sequential(
            nn.ReLU(),
            nn.BatchNorm1d(hidden_size * 2),
            nn.Lineaer(hidden_size * 2, output_size),
            nn.Softmax(dim=-1),
        )

    def forward(self, x):
        # |x| = (batch_size, h, w)
        z, _ = self.rnn(x) # cell state는 필요 없어서 생략
        # |z| = (batch size, h, hidden_size * 2) -> 전체 output
        z = z[:, -1]
        # |z| = (batch_size, hidden_size * 2) => 마지막 것만 가져오기
        y = self.layers(z)
        # |y| = (batch_size, output_size) 

        return y