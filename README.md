# Yorusai-Entrance

文化祭夜の部の入場者を記録、運営を支援

## Devices and Environment

- Barcode Reader(as external keyboard)
- Server
- rails5

## Implementation Strategy

- バーコードによる学籍番号の入力とあらかじめ用意された全員分のリストを照合
- 合致するものがあれば入場として記録
- 入場者のみを抽選の対象とし、時間のロスを未然に防ぐ
