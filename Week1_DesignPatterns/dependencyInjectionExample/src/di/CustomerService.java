package di;

public class CustomerService {
    private CustomerRepository repository;

    public CustomerService(CustomerRepository repository) {
        this.repository = repository;
    }

    public void showCustomer(int id) {
        System.out.println(repository.findCustomerById(id));
    }
}