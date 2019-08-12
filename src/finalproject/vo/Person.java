package finalproject.vo;

public class Person {
   //요청값은 setName 메서드와 숫자형일 경우는 setAge(int num)
   private String name;
   private int age;
   private String loc;
   
   
   
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public int getAge() {
      return age;
   }
   public void setAge(int age) {
      this.age = age;
   }
   public String getLoc() {
      return loc;
   }
   public void setLoc(String loc) {
      this.loc = loc;
   }
   
   
}