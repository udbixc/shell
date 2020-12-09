index($0, "/*"){
  if(index($0,"*/")){
    print gensub("^(.*)\\/\\*.*\\*\\/(.*)$","\\1\\2","g",$0)
  } else {
    print gensub("^(.*/\\*.*)","\\1","g",$0)
    while( (getline var)>0 ){
    if(index(var,"*/")){
      print gensub("^.*\\*/(.*)","\\1","g",$0)
	break
    }
  }
  }
}
!index($0, "/*"){
  print
}
