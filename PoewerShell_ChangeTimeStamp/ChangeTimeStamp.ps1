# アセンブリの読み込み
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")


# フォームを生成
$Form = New-Object System.Windows.Forms.Form
# サイズ
$Form.Size = New-Object System.Drawing.Size(300,330)
# 表示設定
$Form.StartPosition = "manual"
# テキスト
$Form.Text = "【ファイルの日時変更】"


# グループ作成
$MyGroupBox = New-Object System.Windows.Forms.GroupBox
$MyGroupBox.Location = New-Object System.Drawing.Point(50,10)
$MyGroupBox.size = New-Object System.Drawing.Size(150,150)
$MyGroupBox.text = "変更箇所"

# ラジオボタン作成
$RadioButton1 = New-Object System.Windows.Forms.RadioButton
$RadioButton1.Location = New-Object System.Drawing.Point(20,20)
$RadioButton1.size = New-Object System.Drawing.Size(80,30)
$RadioButton1.Checked = $True
$RadioButton1.Text = "作成日時"

$RadioButton2 = New-Object System.Windows.Forms.RadioButton
$RadioButton2.Location = New-Object System.Drawing.Point(20,60)
$RadioButton2.size = New-Object System.Drawing.Size(80,30)
$RadioButton2.Text = "更新日時"

$RadioButton3 = New-Object System.Windows.Forms.RadioButton
$RadioButton3.Location = New-Object System.Drawing.Point(20,100)
$RadioButton3.size = New-Object System.Drawing.Size(100,30)
$RadioButton3.Text = "アクセス日時"


# ラベル作成
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,180)
$label.Size = New-Object System.Drawing.Size(130,20)
$label.Text = '時刻を入力して下さい。:'


# テキストボックス作成
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(150,175)
$textBox.Size = New-Object System.Drawing.Size(125,20)
$textBox.Text = Get-Date -Format "yyyy/MM/dd hh:mm:sss"


# OKボタン作成
$OKButton = new-object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,220)
$OKButton.Size = New-Object System.Drawing.Size(80,40)
$OKButton.Text = "実行"
$OKButton.DialogResult = "OK"


# グループにラジオボタンを入れる
$MyGroupBox.Controls.AddRange(@($Radiobutton1,$RadioButton2,$RadioButton3))

# フォームに各アイテムを入れる
$Form.Controls.AddRange(@($MyGroupBox,$label,$textBox,$OKButton))

# フォーム表示
$dialogResult = $Form.ShowDialog()


if($dialogResult -eq "OK"){

	$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    #Filter = 'テキスト (*.txt,*.csv)|*.txt;*.csv'
    Title = '日時変更するファイルを選択してください'
	}
	
	if($FileBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){
	
    	#[System.Windows.Forms.MessageBox]::Show('選択したファイル：' + $FileBrowser.FileName)
    
	    if($RadioButton1.Checked){
		
			Set-ItemProperty $FileBrowser.FileName -name CreationTime -value $textBox.Text
		
		}
		elseif($RadioButton2.Checked){
		
			Set-ItemProperty $FileBrowser.FileName -name LastWriteTime -value $textBox.Text
		
		}
        elseif($RadioButton3.Checked){
            Set-ItemProperty $FileBrowser.FileName -name LastAccessTime -value $textBox.Text
        }

		
		[System.Windows.Forms.MessageBox]::Show('変更しました。')
    
	}
	else{
	    [System.Windows.Forms.MessageBox]::Show('ファイルは選択されないため、終了します。')
	}

	

}else{
exit
}