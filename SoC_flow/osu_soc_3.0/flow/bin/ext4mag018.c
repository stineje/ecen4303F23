/* This is just a wrapper to execute the perl script
 */
#include <stdio.h>

main(argc,argv)
     int argc;
     char *argv[];
{
  int rv;
  char *path ="/import/cad2/osu_stdcells/bin/ext4mag018.pl";
  rv = execv(path, argv);
  /* if we get here, there was an error */
  fprintf(stderr, "There was an error executing the submit program\n");
  perror("execv:");
  exit(rv);
}
