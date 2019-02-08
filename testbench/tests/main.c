void swerv_putchar (char c)
{
  (*(volatile char *)0xd0580000) = c;
}

void print(char *str)
{
  while (*str) {
    swerv_putchar (*str);
    str++;
  }
}


int main ()
{
  print("HELL");
}
