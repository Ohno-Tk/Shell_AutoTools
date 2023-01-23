# �A�Z���u���̓ǂݍ���
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")


# �t�H�[���𐶐�
$Form = New-Object System.Windows.Forms.Form
# �T�C�Y
$Form.Size = New-Object System.Drawing.Size(300,330)
# �\���ݒ�
$Form.StartPosition = "manual"
# �e�L�X�g
$Form.Text = "�y�t�@�C���̓����ύX�z"


# �O���[�v�쐬
$MyGroupBox = New-Object System.Windows.Forms.GroupBox
$MyGroupBox.Location = New-Object System.Drawing.Point(50,10)
$MyGroupBox.size = New-Object System.Drawing.Size(150,150)
$MyGroupBox.text = "�ύX�ӏ�"

# ���W�I�{�^���쐬
$RadioButton1 = New-Object System.Windows.Forms.RadioButton
$RadioButton1.Location = New-Object System.Drawing.Point(20,20)
$RadioButton1.size = New-Object System.Drawing.Size(80,30)
$RadioButton1.Checked = $True
$RadioButton1.Text = "�쐬����"

$RadioButton2 = New-Object System.Windows.Forms.RadioButton
$RadioButton2.Location = New-Object System.Drawing.Point(20,60)
$RadioButton2.size = New-Object System.Drawing.Size(80,30)
$RadioButton2.Text = "�X�V����"

$RadioButton3 = New-Object System.Windows.Forms.RadioButton
$RadioButton3.Location = New-Object System.Drawing.Point(20,100)
$RadioButton3.size = New-Object System.Drawing.Size(100,30)
$RadioButton3.Text = "�A�N�Z�X����"


# ���x���쐬
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,180)
$label.Size = New-Object System.Drawing.Size(130,20)
$label.Text = '��������͂��ĉ������B:'


# �e�L�X�g�{�b�N�X�쐬
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(150,175)
$textBox.Size = New-Object System.Drawing.Size(125,20)
$textBox.Text = Get-Date -Format "yyyy/MM/dd hh:mm:sss"


# OK�{�^���쐬
$OKButton = new-object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(75,220)
$OKButton.Size = New-Object System.Drawing.Size(80,40)
$OKButton.Text = "���s"
$OKButton.DialogResult = "OK"


# �O���[�v�Ƀ��W�I�{�^��������
$MyGroupBox.Controls.AddRange(@($Radiobutton1,$RadioButton2,$RadioButton3))

# �t�H�[���Ɋe�A�C�e��������
$Form.Controls.AddRange(@($MyGroupBox,$label,$textBox,$OKButton))

# �t�H�[���\��
$dialogResult = $Form.ShowDialog()


if($dialogResult -eq "OK"){

	$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    #Filter = '�e�L�X�g (*.txt,*.csv)|*.txt;*.csv'
    Title = '�����ύX����t�@�C����I�����Ă�������'
	}
	
	if($FileBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK){
	
    	#[System.Windows.Forms.MessageBox]::Show('�I�������t�@�C���F' + $FileBrowser.FileName)
    
	    if($RadioButton1.Checked){
		
			Set-ItemProperty $FileBrowser.FileName -name CreationTime -value $textBox.Text
		
		}
		elseif($RadioButton2.Checked){
		
			Set-ItemProperty $FileBrowser.FileName -name LastWriteTime -value $textBox.Text
		
		}
        elseif($RadioButton3.Checked){
            Set-ItemProperty $FileBrowser.FileName -name LastAccessTime -value $textBox.Text
        }

		
		[System.Windows.Forms.MessageBox]::Show('�ύX���܂����B')
    
	}
	else{
	    [System.Windows.Forms.MessageBox]::Show('�t�@�C���͑I������Ȃ����߁A�I�����܂��B')
	}

	

}else{
exit
}