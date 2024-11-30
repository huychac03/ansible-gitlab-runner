Lệnh chạy playbook set variable ở trong CLI:
- ansible-playbook --extra-vars "GITLAB_URL=https://gitlab.emddi.xyz RUNNER_AUTHENTICATION_TOKEN_1=aaa RUNNER_AUTHENTICATION_TOKEN_2=bbb NUMBER_OF_CONCURRENT=6" -i inventory.ini --private-key=./keys/emddi-devops.pem main.yml

Nhưng khuyến khích dùng cách sau hơn:
   - Đầu tiên ta sẽ sửa file main ở trong theo những thông tin của mình rồi chạy lệnh sau (có thể để --private-key cũng đc hoặc ko nếu ta đã thông 2 host từ trước và nhớ gen key dùng rsa hihi)
   ```
      ansible-playbook -i inventory.ini --private-key=./keys/emddi-devops.pem main.yml
   ```

Ta có thể truyền biến Tokens, số lượng CONCURRENT và Gitlab URL vào 

Variables:
   - RUNNER_AUTHENTICATION_TOKEN_1 : cho runner docker
   - RUNNER_AUTHENTICATION_TOKEN_2 : cho runner shell
   - NUMBER_OF_CONCURRENT : số lượng job mà ta cho phép chạy cùng 1 thời điểm
   - GITLAB_URL : gitlab url

Note: 
   - Nếu bạn chỉ cần runner shell thì hãy sửa ở trong file task như sau: comment 2 phần được đánh dấu là "Optional". Còn nếu chỉ cần docker thì hãy comment cái task shell vào nhé
   - Lưu ý là Ansible mặc định sẽ chỉ tìm key ở dạng 'rsa' nếu ta ko dẫn key private.
   - Ở phần này mình đã để shell sẽ là runner mặc định cho mọi job (allow run untagged_job) còn docker runner sẽ chỉ chạy những job mà có tag là docker
   - Số lượng CONCURRENT mặc định sẽ là 1 và trong phần của mình đang chỉnh là 5
   - Mỗi 1 loại runner ta phải để cấp cho nó 1 RUNNER_AUTHENTICATION_TOKEN riêng để nó có thể có riêng tag. 
   - Thường mình sẽ chỉ cần dùng runner Shell vì nó sẽ nhanh và tiện hơn runner Docker. Khi cài như vậy, ta chỉ đơn giản cần xóa đi 2 block Regist Docker runner và block sửa volume là được.  


