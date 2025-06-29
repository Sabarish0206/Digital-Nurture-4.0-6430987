package observer;

public interface Stock {
    void register(Observer o);
    void unregister(Observer o);
    void notifyObservers();
}
