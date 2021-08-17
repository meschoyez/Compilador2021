#include <stdio.h>
#include <pthread.h> /* POSIX -> gcc -pthread */

#define n 6

void *saludo (void *);

int main () {
  int i = 0;
  pthread_t hilos[n];

  printf("Inicio del programa\n");
  for (i = 0; i < n; ++i) {
    pthread_create(&hilos[i], NULL, saludo, NULL);
  }

  for (i = 0; i < n; ++i) {
    pthread_join(hilos[i], NULL);
  }

  printf("Fin del programa\n");
  return 0;
}


void *saludo  (void *tmp) {
  // %li --> long unsigned (l) int (i)
  printf("Hola, soy hilo %li\n", pthread_self());
  pthread_exit(NULL);
}


