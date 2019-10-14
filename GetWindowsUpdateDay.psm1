###############################################
# Windows Update 日を取得する(日本)
###############################################
function GetWindowsUpdateDay([datetime]$TergetDate){

    # 1日の曜日と US Windows Update 日のオフセット ハッシュテーブル
    $DayOfWeek2WUOffset = @{
        [System.DayOfWeek]"Wednesday"   = 13    # 水曜日
        [System.DayOfWeek]"Thursday"    = 12    # 木曜日
        [System.DayOfWeek]"Friday"      = 11    # 金曜日
        [System.DayOfWeek]"Saturday"    = 10    # 土曜日
        [System.DayOfWeek]"Sunday"      = 9     # 日曜日
        [System.DayOfWeek]"Monday"      = 8     # 月曜日
        [System.DayOfWeek]"Tuesday"     = 7     # 火曜日
    }

    # 年月が指定されていない(default)
    if( $TergetDate -eq $null ){
        # 今の日時
        $TergetDate = Get-Date
    }

    # 1日
    $1stDay = [datetime]$TergetDate.ToString("yyyy/MM/1")

    # US Windows Update 日のオフセット
    $Offset = $DayOfWeek2WUOffset[$1stDay.DayOfWeek]

    if( $Offset -ne $null ){
        # US Windows Update 日
        $WUDayUS = $1stDay.AddDays($Offset)

        # 日本の Windows Update 日(US Windows Update の翌日)
        $WUDay = $WUDayUS.AddDays(1)
    }
    else{
        $WUDay = $null
    }

    return ($WUDay).ToString("yyyy/MM/dd")
}
