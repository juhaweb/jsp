package sub1;

public class Account {

	// Ư�� ( ��� ���� : ���� ���̹� )   (����� ĸ��ȭ�ؾ���. encapsulation : private )
	public String bank;
	public String id;
	public String name;
	public int money;
	
	// ������ : ��� ���� ĸ��ȭ �ؼ� �ʱ�ȭ�� �ȵǳ�.. ��ü���� �� �� ��������� �ʱ�ȭ �ϴ� �޼��� 
	public Account(String bank, String id, String name, int money) {
		this.bank = bank;
		this.id = id;
		this.name = name;
		this.money = money;		
	}

	// ��� ( ��� �޼��� : ����� ���̹� )
	
	// 1. �Ա�
	public void deposit( int money ) {
		this.money += money;   
	}
	
	// 2. ���
	public void withdraw( int money ) {
		this.money -= money;		
	}
	
	// ������ ���� ����� ����. 
	
	
}
