# CNN_to_Verilog
2021/10/18
入力：condfig_input, ???.dat

config_input:
CNNの情報を入力する。
LAYER:ネットワークの構造を入力する。
	CONV: conv, [input_channels], [output_channels]
	MAXPOOL: maxpool, [W], [H]
	FC: fc, [input], [output]
ACT: アクティベーションの種類を選択。現在はReLUのみ。
INPUT: 入力サイズの入力。CH,W,H
CLASS: 出力クラス
WIDTH: bit幅
詳しくはファイル参照。

???.dat
層の重みデータ
python でimport joblibの上、
joblib.dump(weight, "fc1.dat",compress=3)
として出力したもの。
現状、weightの型はlistで用意。
shapeはCNN等で作成されるweightの形と同等で、数値は8bit整数に変換したもの。
名称は fc#.dat or conv#.dat #はFC, Convの各々のn層目

余裕なくてプログラム内にコメントかけてないです申し訳ない。
python3 genCNN.py と実行すればverilogの出力が見られるはずです。
その際、sample_input 内のファイルを実行ディレクトリに配置し、srcsというディレクトリを作成してください。srcsに出力されます。
現在はバイアス項がないです。いずれ追加する予定です。