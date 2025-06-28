# Local CSAF Editor

Getting started with writing documents adhering to the Common Security Advisory Framework (CSAF) [Standard](https://docs.oasis-open.org/csaf/csaf/v2.0/os/csaf-v2.0-os.html) can be a bit overwhelming. This repo offers utility functionality to ease the process.

This readme describes how to start the CSAF editor and modify templates. Describing how to actually *write* CSAF documents would be beyond the scope of this repo. You can find instructions on how to get started under https://doc.bomnipotent.de/integration/secvisogram.

## Basic Usage

### Preparations

The templates stored in this repository are specific to [AUNOVIS GmbH](https://www.aunovis.de). As a first step, you thus want to fork this repository. Then you can locally clone your fork:

```
git clone git@github.com:<your-company-github-or-whatever-account>/local_csaf_editor.git
```

### Starting the Editor

On your machine, run the `run.sh` script with any bash interpreter (on Windows you can use git-bash, for example). The script checks (and in some cases installs) the requirements, and then locally starts the [Secvisogram](https://github.com/secvisogram/secvisogram) CSAF Web Editor.

Secvisogram can optionally be configured to work in tandem with a content management system [backend server](https://github.com/secvisogram/csaf-cms-backend), but to write valid CSAF documents, it is absolutely sufficient to spare yourself the overhead and always run the Secvisogram frontend server in local (dev) mode.

After the frontend server has started (which may take a bit), it is reachable via your web browser, under:

[http://localhost:22002](http://localhost:22002)

> **Please note:** The server is not only reachable via localhost (i.e. your local machine), but also inside your local network. If for some reason you have added a port-forwarding rule inside your router, it is even reachable from the internet. This is why the script runs the server under the randomly selected port 22002, instead of the default port 8080: The latter is used by many other applications as well, meaning that the likelihood that you indeed have set a port forwarding rule for 8080 is comparably high.

### Adjusting Templates

Inside Secvisogram, click "New", then "Upload from Filesystem", and then choose a json file from the templates folder.

Adjust the template to your needs. Especially the publisher fields, which are currently specific to AUNOVIS GmbH. Please don't publish CSAF documents in the name of AUNOVIS.

You may also want to set a default value under "Rules for sharing document" -> [Traffic Light Protocol](https://www.first.org/tlp/).

> *Note:* [Version 2.0](https://docs.oasis-open.org/csaf/csaf/v2.0/os/csaf-v2.0-os.html#32152-document-property---distribution---tlp) of the CSAF Standard only support [Version 1](https://www.first.org/tlp/v1/) of the Traffic Light Protocol, even though it has been deprecated in 2022. I don't make these rules.

Once you have finished editing the template, click on "Export" to store it. Secvisogram will warn you that it is "unsaved", because you have not set up a [backend server](https://github.com/secvisogram/csaf-cms-backend). This is fine. Chose "CSAF json" (*not* "CSAF Json (stripped)"). Secvisogram will warn you that this is an invalid document (because it is in fact not a document, but a template). This is fine. Click on "Save invalid document", and your browser will download the json. No file picker dialogue for you.

Store the new template in the templates folder, and delete any files that are not associated with you or your organization.

### Stopping the Editor

Inside your bash interpreter, type Ctrl+C to stop the Secvisogram frontend server. Or close the terminal window, if you don't care about Secvisogram's feelings.
