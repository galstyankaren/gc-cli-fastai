# gc-cli-fastai
A simple helper for managing a fastai VM instance on google cloud platform 

## Setup

1. Clone the following repo locally 

```bash
git clone https://github.com/galstyankaren/gc-cli-fastai.git
```

2. Add the following lines to your ~/.bash_profile  and fill your zone and instance names

```bash
 alias gc-cli-fastai="path/to/gci-cli-fastai" 
 export ZONE="..."`
 export INSTANCE_NAME_CPU="..." 
 export INSTANCE_NAME_GPU="..."
 ```
3. Restart your terminal session or run  
```bash
 source ~/.bash_profile
 ```

4. Show usage

```bash
 gc-cli-fastai --help
 ```