paper
	修論作成のためのファイル群
	図も全て含んでおりそのままPDF作成可能。
	thesis.zipはoverleafのソースのためそのままoverleafでPDF化可能。
presen
	修論発表スライド
src
	optim
		量子化、再学習用のソースコード
		LeNet, MLP
			修論の際は 
			[LeNet] /work2/y-neo/workspace/auto_optim/all
			[MLP] /work2/y-neo/workspace/auto_optim/fc
			で実行。
		実行環境
			Python 3.6.9
			Gurobi 9.1.2
		実行手順
			$ optim.py -l 0
			で１層目を量子化。
			$ retrain.py -l 0
			で１層目の再学習
			これらは別の端末で並列実行可能。
			終了後に
			$ allread.py -l 0 -m 
			でパレート解のみを cifar-10_conv1/ にコピー。
			これをl += 1して最終層まで実行

			手作業可能だが、自動化できており、１層目終了後に
			$ allread.py -l 0 -m -n -a 
			$ retrain.py -l 0 -n -a
			を別端末で実行することで最終層まで重み調整できる。
	synth
		実際の合成
		conv, fc
			重み調整後の実際の回路を合成できる。
			execute.py のパスを適切に設定すればよい。
				現在のパスは
				/work2/y-neo/workspace/auto_optim/all で量子化
				/work2/y-neo/workspace/vivado/layer で合成
				を想定
		mult
			シフト優先での乗算器を構成。
			execute.pyを実行で最適解、HDL作成、合成まで可能。
		adder
			ビット幅がバラバラな加算器を構成。
			execute.pyを実行で最適解、HDL作成、合成まで可能。
			命名は17進数で0~gで表記。
			最大ビット25までは同様に可能。26~は範囲外のため必要があれば改修必須。


