def run(server):
    @server.route("/")
    def homepage_func():
        import os
        os.system('hostname > host')
        host = ''
        with open('host', 'r') as h:
            for line in h:
                host = host + line
        return "200/Ok from %s"%(host)