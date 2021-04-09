# VVV-Base Sample Config File

```yaml
sites:
    mysite:
        repo: https://github.com/JPry/vvv-base.git
        hosts:
            - mysite.local
            - subdomain.mysite.local
        custom:
            admin_user: mysite
            admin_password: mysite_password
            admin_email: mysite@localhost.local
            title: An Awesome Example Site
            db_prefix: ex_
            multisite: false
            xipio: true
            version: latest
            locale: en_US
            plugins:
                - jetpack
                - { plugin: "redirect-emails-on-staging", activate: true }
                - { plugin: "https://github.com/afragen/github-updater/archive/6.3.1.zip", force: true, activate: true }
            themes:
                - twentyeleven
            delete_default_plugins: true
            delete_default_themes: true
            wp_content: https://github.com/jquery/jquery-wp-content.git
            wp: true
            htdocs: https://github.com/salcode/example-project-w-gitignore.git

vvvbase:
    db:
        host: localhost
        user: root
        pass: root

    plugins:
        - jetpack

    themes:
        - hestia
```
