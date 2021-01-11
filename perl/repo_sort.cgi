#!C:\Strawberry/perl/bin/perl

use strict;
use warnings;
use Smart::Comments;
use Encode 'encode';
#cgiヘッダーの出力

opendir(DIR, "db/users");
my @files = readdir DIR;
@files =reverse(sort (@files));
#↓.csvと-をはずしたファイル
my @target = ();       
#↓最初の月の始まり
my $target_start = "";
#月の始まり変更用の配列
my @start_array = ();
#↓最初の月の終わり
my $target_end = "";
#月の終わり変更用の配列
my @end_array = ();
#↓ファイルの数
my $file_count = 0;
#ハッシュを作成
my %files_set = {};
foreach my $file(@files){
  next if($file eq "." || $file eq "..");
  my $buffe_file = $file;
  if($file_count == 0){
    $file =~ s/.csv//g;
    my @spl_fileName = split(/-/, $file);
    if($spl_fileName[2] > 10){
      $spl_fileName[1] =$spl_fileName[1]++;
      if($spl_fileName[1] gt 12){
        $spl_fileName[1] = 1;
      }
    }
    @start_array = @spl_fileName;
    $spl_fileName[2] = 11;
    $target_start = join(//, @spl_fileName);
    $spl_fileName[1]++;
    if($spl_fileName[1] > 12){
      $spl_fileName[1] = 1;
      $spl_fileName[0]++;
    }
    $spl_fileName[2] = 10;
    @end_array = @spl_fileName;
    $target_end = join(//, @spl_fileName);
  }
  $file =~ s/.csv//g;
  $file =~ s/-//g;
  $files_set{$file} = $buffe_file; 
  push(@target, $file);
  $file_count++;
}
@target = reverse(sort(@target));


my @buff_start = ();
my @buff_end = ();
my @repo_area = ();
my $buff_repo_sort = "";
### %files_set
### @target
my @print_db = ();
my $buff = "";
foreach my $open_file(@target){
  if($open_file =~ /-/){
    next;
  }
  #$open_fileが$target_start以上で、$target_endより以下の場合
  if($open_file ge $target_start && $open_file le $target_end){
    #target_startとtarget_endを-で連結し配列に追加
    my $repo_sort = join('-', $target_start, $target_end);
    my $print_file = "./db/users/$repo_sort.csv";
    my $open_sort = "./db/users/$files_set{$open_file}";
    ### $open_sort
    open (ODB, "$open_sort");
    while(<ODB>){
      $buff = $_;
    }
    @print_db = split(/,/, $buff);
    ### $buff
    open (DB, ">> $print_file");
    print DB " $print_db[0], $print_db[1], $print_db[2], $print_db[3]\r";
    close(DB);
    close(ODB);
    if($buff_repo_sort eq $repo_sort){
      next;
    }
    push(@repo_area, $repo_sort);
  }else{
    #target_startとtarget_endを年月日に分解して変数に代入
    my $buffStart_splitYear = substr($target_start, 0, 4);
    my $buffStart_splitMonth = substr($target_start, 4, 2);
    my $buffStart_splitData = substr($target_start, 6, 2);
    my $buffEnd_splitYear = substr($target_end, 0, 4);
    my $buffEnd_splitMonth = substr($target_end, 4, 2);
    my $buffEnd_splitData = substr($target_end, 6, 2);
    $buffStart_splitMonth--;
    $buffEnd_splitMonth--;
    if($buffStart_splitMonth == 0){
      $buffStart_splitMonth = 12;
      $buffStart_splitYear--;
      $buffStart_splitYear = sprintf("%04d", $buffStart_splitYear);
    }elsif($buffEnd_splitMonth == 0){
      $buffEnd_splitMonth = 12;
      $buffEnd_splitYear--;
      $buffEnd_splitYear = sprintf("%04d", $buffEnd_splitYear);
    }
    $buffStart_splitMonth = sprintf("%02d", $buffStart_splitMonth);
    $buffEnd_splitMonth = sprintf("%02d", $buffEnd_splitMonth);
    $target_start = join('', $buffStart_splitYear, $buffStart_splitMonth, $buffStart_splitData);
    $target_end = join('', $buffEnd_splitYear, $buffEnd_splitMonth, $buffEnd_splitData);
    my $repo_sort = join('-', $target_start, $target_end);

    my $print_file = "./db/users/$repo_sort.csv";
    my $open_sort = "./db/users/$files_set{$open_file}.csv";

    open (ODB, "$open_sort");
    while(<ODB>){
      $buff = $_;
    }
    @print_db = split(/,/, $buff);
    ### $buff
    open (DB, ">> $print_file");
    print DB " $print_db[0], $print_db[1], $print_db[2], $print_db[3]\r";
    close(DB);
    close(ODB);
    push(@repo_area, $repo_sort);

    $buff_repo_sort = $repo_sort;
  }
  @print_db = ();
  $buff = "";
}
### @repo_area

print "Content-Type: text/html;charset=utf-8\n\n";
open(FILE, "html/repo_new.html");
my @html = <FILE>;
close(FILE);

for my $html (@html){
	print $html;
}

exit;