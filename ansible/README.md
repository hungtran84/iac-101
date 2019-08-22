* Access to Cloud Shell

* Run the playbook in Check Mode
```
ansible-playbook <your_playbook>.yaml --check

```

* Create GCE instance
```
ansible-playbook <your_playbook>.yaml --skip-tags "delete"
```

* Delete GCE instance
```
ansible-playbook <your_playbook>.yaml --tags "delete"
```




