
package model;

import java.util.*;

public interface Operations {
    
    public void Insert(Object obj);
    public List<?> Load();
    public List<?> Search(String text );
}
