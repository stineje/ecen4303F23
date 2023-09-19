/*
  This is chiplogo a logo generator for VLSI chips.
  The format is either magic or cif.
  The layer name and technology cab be selected as a command line option.
  
  To compile the file just type "make".
  
  Enjoy,
  
  March 20th 1995
  
  Alireza Moini
  Centre for GaAs VLSI Technology
  The University of Adelaide
  SA 5005
  Australia
  
  moini@eleceng.adelaide.edu.au
  
  Last improvements
  
  - Major bug fixes
  - Creates a layout with less error
  - It prints an approximate view of the layout
  - The magic layout is now upright, so you don't need to upsidedown it 

  Modified by James Stine (james.stine@okstate.edu)
  Oklahoma State University, 10/26/18

*/

#include <stdio.h>
#include <math.h>
#include <string.h>
#include <stdlib.h>

void chiplogo(void );
void find_error(int *array[],int *error[],int x,int y,int width,int space);
int display_array(int x,int y);

#define ARRAY_SIZE 65536
/* If you get the segmentation error change this value to smaller sizes */
int min_width=2,min_space=2,thresh_before=4,thresh_after=4,scale_factor=1;
int cif_choice=0,magic_choice=1,cif_lambda=50,error_correct=0;
int smooth_before=0,smooth_after=0;
int *image_out[ARRAY_SIZE];
int ARRAY_XSIZE=1,ARRAY_YSIZE=1;
char *input_file,*output_file,*cif_layer,*magic_layer,*magic_tech;
int DEBUG=0;
int view_array=1000;
int *array[ARRAY_SIZE], *array2[ARRAY_SIZE];


/*
  To shrink the array after the processing (error correction)
*/
void error_mess(void) {

  printf("\n USAGE :\n xchiplogo [-c cif_layer_name] [-m magic_layer_name] [-w width] [-s scale] [-t tech_name] [-e] [-v view_array] [-B  threshold_before] [-A threshold_after] input_file [output_file]\n\n");
  printf("The options are: \n");
  printf(" cif_layer_name   => the cif layer name that you like\n");
  printf(" magic_layer_name => the magic layer name\n");
  printf(" width            => the minimum width of the layer \n");
  printf(" scale            => the scale factor \n");
  printf(" tech_name        => the technology name for magic \n");
  printf(" e                => toggles the error detection and correction option \n");
  printf(" view_factor      => sets the viewing option. 0=NO view, a value greater than or ");
  printf("                    equal to one means view with the scaling set at this value \n");
  printf(" threshold_before => the threshold value used in the smoothing before error ");
  printf("                         correction (from 4 to 16)\n");
  printf(" threshold_after  => the threshold value used in the smoothing after error ");
  printf("                         correction (from 4 to 16)\n");
  printf(" NOTE: The input file should be in the ascii bit map format\n\n");

  printf("\n the defaults are as follows:\n\n");
  printf("          magic_tech_name   = scmos \n");
  printf("          magic_layer_name  = poly \n");
  printf("          minimum_width     = 1\n");
  printf("          scale             = 1\n");
  printf("          error_correct     = 1\n");
  printf("          threshold_before  = 4 (max=16) \n");
  printf("          magic_output_file = logo.mag \n");
  printf("          cif_output_file   = logo.cif \n");
  exit(1);
}

void chiplogo(void ) {

  FILE *fpin, *fpout;
  char tmp_c;
  char *tmp;
  int width=1, space=1, scale=1, tech=0;
  int x=0,y=0,base=1,junk=0;
  int i,j,row,column;
  int max_col=35;
  int max_row;
  int x_corner,y_corner;
  int threshold_after=4,threshold_before=4;

  scale=scale_factor;
  width=min_width;
  space=min_space;
  threshold_before=thresh_before;
  threshold_after=thresh_after; 

  /*
    Now parse the input file name 
  */
  if((fpin=fopen(input_file,"r")) == NULL) {
    printf("cannot open input file\n");
    return;
  }
  
  tmp= (char *) malloc(2048*sizeof(char));
  if(tmp == NULL){
    printf("there is not enough memory\n");
    fclose(fpin);
    return;
  }
  
  i=0;
  /* first see if it has the P1 header or not */
  fscanf(fpin,"%2s",tmp);
  if(strcmp(tmp,"P1")){
    printf("This doesn't seem like a pbm file, because it doesn't have the P1 header");
  }

  /* Now skip the next line which is about XV and its version */
  /* but this line should start with # */
  fscanf(fpin,"%s",tmp);
  while(!strncmp(tmp,"#",1)){
    fscanf(fpin,"%*[^\n]");
    getc(fpin);
    fscanf(fpin,"%s",tmp);
  }
  
  ARRAY_XSIZE = x = (int)atoi(tmp);
  fscanf(fpin,"%s",tmp);
  ARRAY_YSIZE = y = (int)atoi(tmp);
  if(ARRAY_YSIZE == 0 ||  ARRAY_XSIZE ==0){
    fclose(fpin);
    free(tmp);
    printf("array has a size of zero\n");
    return;
  }

  for(i=0;i<ARRAY_SIZE;i++) {
    image_out[i]=(int *)calloc((ARRAY_YSIZE+2*width+2),sizeof(int *));
    if(image_out[i]==NULL){
      printf("there is not enough memory\n");
      exit(0);
    }
    array[i]=(int *)calloc((ARRAY_YSIZE+2*width+2),sizeof(int *));
    if(array[i]==NULL){
      printf("there is not enough memory\n");
      exit(0);
    }
    array2[i]=(int *)calloc((ARRAY_YSIZE+2*width+2),sizeof(int *));
    if(array2[i]==NULL){
      printf("there is not enough memory\n");
      exit(0);
    }
  }

  max_row=x*y;
  max_row++;
  max_row=max_row/35;
  max_row++;
  row=0;column=0;
  
  for(i=0;i<(x*(y));i++) {
    fscanf(fpin,"%d",&array[i-((i/x)*x)][i/x]);
  } 
 
  /*
    Now use some design rule error correction to get rid of the errors
  */
  enlarge_array(array,x,y,width+2);
  if(smooth_before==1) {
    smooth_array(array,x,y,threshold_before,width);
  }
 
  if(error_correct==1) {
 
    /* array is the input array and array2 shows the location of errors */
    find_error(array,array2,x,y,width,space);
    for(column=0;column<y;column++) {
      for(row=0;row<x;row++) {
	array[row][column]=array2[row][column]+array[row][column];
      }
    }
  }
 
  if(smooth_after==1) {
    smooth_array(array,x,y,threshold_after,width);
  }

  shrink_array(array,x,y,width+2);
 
  for(i=0;i<ARRAY_XSIZE;i++){
    for(j=0;j<ARRAY_YSIZE;j++){
      image_out[i][j]=array[i][j];
    }
  }
 
  /*
    Now write the magic or cif file
  */
  if(magic_choice==1 && cif_choice ==0) {

      if((fpout=fopen(output_file,"w")) == NULL) {
        printf("cannot open output file\n");
	return;
      }

      fprintf(fpout,"magic\ntech  %s\ntimestamp 777777777\n", magic_tech);
      fprintf(fpout,"<< %s >>\n", magic_layer);
      for(column=0;column<y;column++){
	for(row=0;row<x;row++){
 
	  if(array[row][column] ==1){
	    base=scale;
	    y_corner=y-column;
	    y_corner*=base;
	    x_corner=row*base;
	    fprintf(fpout,"rect %d %d %d %d\n",
		    x_corner,y_corner,x_corner+base,y_corner+base);
	  } 
        }
      }
      fprintf(fpout,"<< end >>\n");
    }

 
  /*
    This piece is to create the cif file
  */
  else {
    if((fpout=fopen(output_file,"w")) == NULL) {
      printf("cannot open output file\n");
      return;
    }
    fprintf(fpout,"DS 1 %d 2;\n9 logo;\nL %s;\n", cif_lambda, cif_layer);
    for(column=0;column<y;column++) {
      for(row=0;row<x;row++) { 
	if(array[row][column] ==1) {
	  base=10*scale*width;
	  y_corner=y-column;
	  y_corner*=base;
	  x_corner=base*row-width; 
	  fprintf(fpout,"B %d %d %d %d;\n",
		  base+2*width,base,x_corner+(base/2),y_corner+(base/2));
	}
      }
    }
    fprintf(fpout,"DF;\nC 1;\nEnd\n");
  }
  display_array(x,y);

  for(i=0;i<ARRAY_SIZE;i++) {

    free(array[i]);
    free(array2[i]);
  }
  free(tmp);

  fclose(fpin);
  fclose(fpout);
 
}
 

/*
  To shrink the array after the processing (error correction)
*/
 
int shrink_array(int *array[],int x,int y,int width) {

  int i,j;
  for(i=0;i<x+width-1;i++) {
    for(j=0;j<y+width-1;j++) {
      if(i>width-1 || j>width-1 ) array[i][j]=array[i+width][j+width];
    }
  }
  return(0);
}
 
 
/*
  To smooth the array after the processing (error correction)
*/
 
int smooth_array(int *array[],int x,int y,int threshold,int width) {

  int column,row,*array2[ARRAY_SIZE],tmp,i,j,total=0;
 
  for(i=0;i<ARRAY_SIZE;i++) {
    array2[i]=(int *)malloc((ARRAY_YSIZE+2*width)*sizeof(int));
  }
  
  for(column=0;column<y;column++) {
    for(row=0;row<x;row++){
      array2[row][column]=0;
    }
  }
  for(i=-(width/2);i<width/2+1;i++) {
    for(j=-(width/2);j<width/2+1;j++) {
      total+=(width/2-max(abs(i),abs(j))+1);
    }
  }
  for(column=width;column<y+width-1;column++) {
    for(row=width;row<x+width-1;row++) {
      tmp=0;

      for(i=-(width/2);i<width/2+1;i++) {
	for(j=-(width/2);j<width/2+1;j++) {
	  tmp+=array[row+i][column+j]*(width/2-max(abs(i),abs(j))+1);
	}
      }
      if(16*tmp>total*threshold) array2[row][column]=1;
      else array2[row][column]=0;
    }
  }
  for(column=0;column<y;column++) {
    for(row=0;row<x;row++) {
      array[row][column]=array2[row][column];
    }
  }
  for(i=0;i<ARRAY_SIZE;i++) {
    free(array2[i]);
  }
 
  return(0);
}
 
/*
  Calculate the maximum of the two numbers
*/
int max(int i, int j) {

  if(i<=j) return(j);
  else return(i);
}


/* 
   To enlarge the array before the processing (error correction) 
*/
int enlarge_array(int *array[],int x,int y,int width) {
  int i=0,j=0;
  for(i=x+2*width-1;i>=0;i--) {
    for(j=y+2*width-1;j>=0;j--) {
      if((i<width) || (j<width) || (i>(x-1+width)) || (j>(y-1+width))) {
	array[i][j]=0;
      }      
      else {
	array[i][j]=array[i-width][j-width];
      }      
    }
  }
  return(0);
}

 
/*
  Nor use some design rule error correction methods to get rid of the errors
  (rs in the array)
  The algorithm is pretty simple (just one layer to be handled)
*/
void find_error(int *array[],int *error[],int x,int y,int width,int space) {

  int i=0,j=0,tmp=0,k=0,tmp1=0;
  for(i=0;i<ARRAY_XSIZE+1;i++) {
    for(j=0;j<ARRAY_YSIZE+1;j++) {
      error[i][j]=0;
    }
  }
 
  /* 
     first find the horizontal width errors 
     note that the input array has been enlarged before 
  */
  for(j=width;j<y+width+1;j++) {
    for(i=width;i<x+width+1;i++) {
      tmp=0; tmp1=0;
      for(k=width;k>0;k--) {
	if(array[i-k][j]+error[i-k][j]>0) {
	  tmp1+=1; tmp=1;
	}
	if(array[i-k][j]+error[i-k][j]==0 && tmp==1 )
	  tmp=2;
      }

      if(tmp1<width && tmp1>0 && tmp==1 && array[i][j]==0) 
	error[i][j]=1;
    }
  }
 
 
 
  /* 
     now find the vertical width errors 
       note that the input array has been enlarged before 
  */
  for (i=width;i<x+width+1;i++) {
    for (j=width;j<y+width+1;j++) {
      tmp=0; tmp1=0;
      for (k=width;k>0;k--) {
	if (array[i][j-k]+error[i][j-k]>0) {
	  tmp1+=1;tmp=1;
	}
	if (array[i][j-k]+error[i][j-k]==0 && tmp==1 )
	  tmp=2;
      } 
      if (tmp1<width && tmp1>0 && tmp==1 && array[i][j]==0) 
	error[i][j]=1;
    }
  }
 
}
 

int display_array(int x,int y) {

  int row,column,j;
  printf("Here is an approximate view of what you will get!!\n\n");
  if(view_array==1000) j=y/80+1;
  else j=view_array;
  for(row=0;row<y;row+=j) {
    for(column=0;column<x;column+=j) {
      if(array[column][row] == 1) printf("*");
      else printf(" ");
    }
    printf("\n");
  }
  return(0);
}


int main(int argc, char* argv[]) {

  FILE*fpin,*fpout;
  char*s,*tmp;
  int cif=0, magic=0;
  int input=0,output=0;
  int x_corner,y_corner;
  
  input_file = (char *)calloc(256,sizeof(char));
  output_file = (char *)calloc(256,sizeof(char));
  s = (char *)calloc(256,sizeof(char));
  magic_tech = (char *)calloc(256,sizeof(char));
  cif_layer = (char *)calloc(256,sizeof(char));
  magic_layer = (char *)calloc(256,sizeof(char));
  tmp = (char *)calloc(256,sizeof(char));
  
  sprintf(cif_layer,"CPG");
  sprintf(magic_layer,"poly");
  sprintf(magic_tech,"scmos");
  
  while ((--argc )  && (++argv )&& (**argv == '-')) {
    s = argv[0] + 1;
    switch (*s) {
    case 'm':
      magic=1;
      *++argv;
      sprintf(magic_layer,"%s",*argv);
      argc--;
      break;
    case 'c':
      cif=1;
      *++argv;
      sprintf(output_file,"logo.cif");
      sprintf(cif_layer,"%s",*argv);
      argc--;
      break;
    case 't':
      argc--;
      *++argv;
      sprintf(magic_tech,"%s",*argv);
      break;
    case 'v':
      view_array=atoi(*++argv);
      argc--;
      break;
    case 'A':
      thresh_after=atoi(*++argv);
      smooth_after=1;
      argc--;
      break;
    case 'B':
      thresh_before=atoi(*++argv);
      smooth_before=1;
      argc--;
      break;
    case 'h':
      error_mess();
      break;
    case 'e':
      error_correct=1;
      break;
    case 'w':
      min_width=atoi(*++argv);
      argc--;
      break;
    case 's':
      scale_factor=atof(*++argv);
      argc--;
      break;
    default:
      break;
    }
  }

  if (argc) {     /* input file name supplied? */
    input=1;
    sprintf(input_file,"%s",*argv++); argc--;
    if((fpin=fopen(input_file,"r")) == NULL) {
      printf("cannot open input file \n");
      exit(1);
    }
    fclose(fpin);
  }

  if (argc) {     /* output file name supplied? */
    sprintf(output_file,"%s",*argv++); argc--;
    if((fpout=fopen(output_file,"w")) == NULL) {
      printf("cannot open output file \n");
      exit(1);
    }
    fclose(fpout);
  }

  if (argc) {     /* extra args must be errors */
    error_mess();
    exit(0);
  }

  if(input == 0 ) 
    error_mess();

  if(cif ==1 && magic ==1) { 
    printf("\n you can not have both cif and magic options active, just select one\n");
    exit(1);
  }
  if(min_width < 1) { 
    printf("\n the minimum width should be an integer grater than '1'\n");
    exit(1);
  }

  chiplogo();
  printf("\n   Logo successfully generated \n"); 
  exit(0);
}
 
 
 
