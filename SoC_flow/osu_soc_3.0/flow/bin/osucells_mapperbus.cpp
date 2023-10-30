// Reads CDS mapfiles and generates IRSIM vectors
// Johannes Grad, IIT

#include <fstream.h>
#include <string.h>
#include <iostream.h>
#include <stdlib.h>

int startsWith(char *line, char *substr) {
  unsigned int i;
  for(i=0;i<strlen(substr);i++) if (line[i]!=substr[i]) return 0;
  return 1;
}

void strcrop(char* line, int n1, int n2) {
  int i;
  for(i=n1;i<n2;i++) line[i-n1]=line[i];
  line[i-n1]='\0';
}

int main(int argc, char **argv) {
  int i,imax;
  int pins[128];
  if(argc!=5){
    cout<<"Wrong arguments..."<<endl;
    cout<<"Usage: "<<argv[0]<< " mapfile signalname busCharLeft busCharRight"<<endl;
    cout<<"  mapfile: As generated from ICFB"<<endl;
    cout<<"  signalname: Bus or signal name (e.g. clk, A, B, Z, Q, etc.)"<<endl;
    cout<<"  busCharLeft: Left bus character, e.g. [,<,{,("<<endl;
    cout<<"  busCharRight: Right bus character, e.g. ],>,},)"<<endl;
    cout<<""<<endl;
    cout<<"  Example command line:"<<endl;
    cout<<"  mapper map a '<' '>'"<<endl;
    cout<<""<<endl;
    exit(1);
  }
  imax=0;
  for(i=0;i<128;i++) pins[i]=-1;
  char* line=new char[1000];
  char leftDelim=argv[3][0];
  char rightDelim=argv[4][0];
  ifstream inFile(argv[1], ios::in);
  while(!inFile.eof()){
    inFile.getline(line, 999);
    if(startsWith(line,"\"/")){
      strcrop(line,2,strlen(line));
      if(startsWith(line,argv[2])){
	strcrop(line,strlen(argv[2]),strlen(line));
	if(startsWith(line,&leftDelim)){
	    strcrop(line,1,strlen(line));
	    i=atoi(line);
	    if(i>imax) imax=i;
	    while(line[0]!=rightDelim) strcrop(line,1,strlen(line));
	    strcrop(line,5,strlen(line));
	    pins[i]=atoi(line);
	}
	if(startsWith(line,"v")){
	  strcrop(line,4,strlen(line));
	  pins[0]=atoi(line);
	}
      }
    }
  }
  cout<<"vector "<<argv[2]<<" ";
  if(imax==0) cout<<pins[0];
  else{
    for(i=imax;i>-1;i--) cout<<pins[i]<<" ";
  }
  cout<<endl;
  inFile.close();
  return 0;
}


